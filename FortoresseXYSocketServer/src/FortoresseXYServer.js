import "dotenv/config";
import WebSocket, { RawData, WebSocketServer } from "ws";
import { program } from "commander";
import { Bodies, Composite, Engine } from "matter-js";
import { Peer } from "./Peer";
import { PacketType } from "./packets/PacketType";
import { PressButtonPacket } from "./packets/PressButtonPacket";
import { WorldEntityPacket, WorldPacketEntityType } from "./packets/WorldPacket";

const frameRate = 60;

class FortoresseXYServer {
    /**
     * @type {Date | null}
     */
    stopSchedule = null;
    /**
     * @type {WebSocketServer | null}
     */
    wss = null;
    /**
     * @type {Map<WebSocket, Peer>}
     */
    peers = new Map;
    /**
     * @type {Engine}
     */
    engine = Engine.create({
        gravity: { x: 0, y: 10, scale: 1 },
    });

    constructor() {
        // Parse command line
        const options = this.parseCommandLine();
        const port = Number(options.port);

        // Initialize WebSocket server
        this.initialize(port);

        // Simulation loop
        this.simulationLoop();
    }

    parseCommandLine() {
        program.option("--port <port>");
        program.parse();
        return program.opts();
    }

    initialize(port) {
        this.wss = new WebSocketServer({
            port,
        });
        this.wss.on("connection", this.handleConnection.bind(this));

        // Test ground
        const ground = Bodies.rectangle(0, 300, 800, 600);
        Composite.add(this.engine.world, [ground]);

        // Auto close if no immediate connection occurs
        setTimeout(() => {
            this.autoClose();
        }, 5_000);
    }

    handleConnection(ws) {
        const peer = new Peer(ws);
        this.peers.set(ws, peer);

        // Handle error
        ws.on("error", (error) => {
            this.peers.delete(ws);
            console.error(error.message);
            this.autoClose();
        });

        // Handle close
        ws.on("close", () => {
            this.peers.delete(ws);
            this.autoClose();
        });

        ws.on("open", () => {
            // Test spawning
            peer.spawn(this.engine);
        });

        // Handle message
        ws.on("message", (dataBuffer, isBinary) => {
            if (dataBuffer instanceof Buffer && !isBinary) {
                const data = JSON.parse(dataBuffer.toString("utf8"));
                this.handleMessageJSON(peer, data);
            }
        });
    }

    handleMessageJSON(peer, data) {
        if (data.type == PacketType.PRESS_BUTTON) {
            peer.handlePressButtonPacket(data);
        }
    }

    autoClose() {
        if (this.peers.size == 0) {
            this.stopSchedule = new Date();
        }
    }

    simulationLoop() {
        let lastTickMs = Date.now();
        this.simulate(Date.now() - lastTickMs);

        const interval = setInterval(() => {
            // Handle execution stop
            if (this.stopSchedule != null && Date.now() >= this.stopSchedule.valueOf()) {
                clearInterval(interval);
                this.wss.close();
                return;
            }

            this.simulate(Date.now() - lastTickMs);

            lastTickMs = Date.now();
        }, 1_000 / frameRate);
    }

    simulate(delta) {
        // Move humans
        this.moveHumans();

        // Step simulation
        Engine.update(this.engine, delta);

        // Send world packets to all peers
        this.sendWorldPackets();
    }

    moveHumans() {
        for (const [, peer] of this.peers) {
            if (peer.human != null) {
                peer.human.move();
            }
        }
    }

    sendWorldPackets() {
        const worldPacket = JSON.stringify(this.worldPacket());
        for (const [ws, ] of this.peers) {
            ws.send(worldPacket);
        }
    }

    worldPacket() {
        const entities = [];
        for (const [, peer] of this.peers) {
            const { human } = peer;
            if (human != null) {
                entities.push({
                    type: WorldPacketEntityType.HUMAN,
                    playerId: peer.playerId,
                    x: human.body.position.x,
                    y: human.body.position.y,
                    facingLeft: human.facingLeft,
                    facingRight: human.facingRight,
                    pose: human.pose,
                });
            }
        }
        return {
            type: PacketType.WORLD,
            entities,
        };
    }
}

new FortoresseXYServer();