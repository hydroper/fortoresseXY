import { WebSocket } from "ws";
import { Human } from "fortoresseXY/Human";
import { PressButtonPacket } from "fortoresseXY/packets/PressButtonPacket";
import { Bodies, Composite, Engine } from "matter-js";

export class Peer {
    public readonly ws: WebSocket;
    public playerId: string = "";
    public human: Human | null = null;

    public constructor(ws: WebSocket) {
        this.ws = ws;
    }

    public spawn(engine: Engine): void {
        const body = Bodies.circle(100, 100, 45);
        Composite.add(engine.world, [body]);
        this.human = new Human(body);
    }

    public handlePressButtonPacket(packet: PressButtonPacket): void {
        this.human?.handlePressButtonPacket(packet);
    }
}