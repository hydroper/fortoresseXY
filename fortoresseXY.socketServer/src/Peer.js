import { WebSocket } from "ws";
import { Bodies, Composite, Engine } from "matter-js";
import { Human } from "./Human";
import { PressButtonPacket } from "./packets/PressButtonPacket";

export class Peer {
    /**
     * @type {WebSocket}
     */
    ws;
    /**
     * @type {string}
     */
    playerId = "";
    /**
     * @type {Human | null}
     */
    human = null;

    /**
     * @param {WebSocket} ws 
     */
    constructor(ws) {
        this.ws = ws;
    }

    /**
     * @param {Engine} engine
     */
    spawn(engine) {
        const body = Bodies.circle(100, 100, 45);
        Composite.add(engine.world, [body]);
        this.human = new Human(body);
    }

    /**
     * @param {PressButtonPacket} packet
     */
    handlePressButtonPacket(packet) {
        this.human?.handlePressButtonPacket(packet);
    }
}