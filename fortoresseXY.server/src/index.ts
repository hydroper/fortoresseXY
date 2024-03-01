import WebSocket, { RawData, WebSocketServer } from "ws";
import { OptionValues, program } from "commander";

const frameRate: number = 60;

class FortoresseXYServer {
    private stopSchedule: Date | null = null;
    private wss: WebSocketServer | null = null;
    private readonly peers: Map<WebSocket, Peer> = new Map<WebSocket, Peer>;

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
        this.simulate();

        const interval = setInterval((): void => {
            // Handle execution stop
            if (this.stopSchedule != null && Date.now() >= this.stopSchedule.valueOf()) {
                clearInterval(interval);
                this.wss.close();
                return;
            }

            this.simulate();
        }, 1_000 / frameRate);
    }

    private simulate(): void {
    }
}

class Peer {
    public readonly ws: WebSocket;

    public constructor(ws: WebSocket) {
        this.ws = ws;
    }
}

new FortoresseXYServer();