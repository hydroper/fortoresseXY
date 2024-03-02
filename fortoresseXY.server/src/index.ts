import WebSocket, { RawData, WebSocketServer } from "ws";
import { OptionValues, program } from "commander";
import { Engine } from "matter-js";
import { Human } from "./lib/Human";
import { WorldEntityPacket, WorldPacket } from "./lib/WorldPacket";

const frameRate: number = 60;

class FortoresseXYServer {
    private stopSchedule: Date | null = null;
    private wss: WebSocketServer | null = null;
    private readonly peers: Map<WebSocket, Peer> = new Map<WebSocket, Peer>;
    private readonly engine: Engine = Engine.create({
        gravity: { x: 0, y: 10, scale: 1 },
    });

    public constructor() {
        // Parse command line
        const options = this.parseCommandLine();
        const port = Number(options.port);

        // Initialize WebSocket server
        this.initialize(port);

        // Simulation loop
        this.simulationLoop();
    }

    private parseCommandLine(): OptionValues {
        program.option("--port <port>");
        program.parse();
        return program.opts();
    }

    private initialize(port: number): void {
        this.wss = new WebSocketServer({
            port,
        });
        this.wss.on("connection", this.handleConnection.bind(this));

        // Auto close if no immediate connection occurs
        setTimeout((): void => {
            this.autoClose();
        }, 5_000);
    }

    private handleConnection(ws: WebSocket): void {
        const peer = new Peer(ws);
        this.peers.set(ws, peer);

        // Handle error
        ws.on("error", (error: Error): void => {
            this.peers.delete(ws);
            console.error(error.message);
            this.autoClose();
        });

        // Handle close
        ws.on("close", (): void => {
            this.peers.delete(ws);
            this.autoClose();
        });

        // Handle message
        ws.on("message", (dataBuffer: RawData, isBinary: boolean) => {
            if (dataBuffer instanceof Buffer && !isBinary) {
                const data = JSON.parse(dataBuffer.toString("utf8"));
            }
        });
    }

    private autoClose(): void {
        if (this.peers.size == 0) {
            this.stopSchedule = new Date();
        }
    }

    private simulationLoop(): void {
        let lastTickMs: number = Date.now();
        this.simulate(Date.now() - lastTickMs);

        const interval = setInterval((): void => {
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

    private simulate(delta: number): void {
        // Move humans
        this.moveHumans();

        // Step simulation
        Engine.update(this.engine, delta);

        // Send world packets to all peers
        this.sendWorldPackets();
    }

    private moveHumans(): void {
        for (const [, peer] of this.peers) {
            if (peer.human != null) {
                peer.human.move();
            }
        }
    }

    private sendWorldPackets(): void {
        const worldPacket = JSON.stringify(this.worldPacket());
        for (const [ws, ] of this.peers) {
            ws.send(worldPacket);
        }
    }

    private worldPacket(): WorldPacket {
        const entities: WorldEntityPacket[] = [];
        for (const [, peer] of this.peers) {
            const { human } = peer;
            if (human != null) {
                entities.push({
                    type: "human",
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
            type: "world",
            entities,
        };
    }
}

class Peer {
    public readonly ws: WebSocket;
    public playerId: string = "";
    public human: Human | null = null;

    public constructor(ws: WebSocket) {
        this.ws = ws;
    }
}

new FortoresseXYServer();