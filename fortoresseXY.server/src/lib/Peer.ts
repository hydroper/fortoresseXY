import { WebSocket } from "ws";
import { Human } from "fortoresseXY/Human";

export class Peer {
    public readonly ws: WebSocket;
    public playerId: string = "";
    public human: Human | null = null;

    public constructor(ws: WebSocket) {
        this.ws = ws;
    }
}