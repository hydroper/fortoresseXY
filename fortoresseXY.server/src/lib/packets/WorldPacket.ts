import { HumanPoseType } from "fortoresseXY/Human";

export type WorldPacket = {
    type: "world",
    entities: WorldEntityPacket[],
};

export type WorldEntityPacket = {
    type: "human",
    playerId: string,
    x: number,
    y: number,
    facingLeft: boolean,
    facingRight: boolean,
    pose: HumanPoseType,
};