import WebSocket, { RawData, WebSocketServer } from "ws";
import { OptionValues, program } from "commander";

class FortoresseXYServer {
    private wss: WebSocketServer | null = null;

    public constructor() {
        // Parse command line
        const options = this.parseCommandLine();
        const port = Number(options.port);

        // Initialize WebSocket server
        this.initialize(port);
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
        // Handle error
        ws.on("error", (error: Error): void => {
            console.error(error.message);
            this.autoClose();
        });

        // Handle close
        ws.on("close", (): void => {
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
        // - If number of peers is non zero, return.
        // - Schedule server execution stop.
        toDo();
    }
}

new FortoresseXYServer();