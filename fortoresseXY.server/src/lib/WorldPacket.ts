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
    sitting: boolean,
    movingLeft: boolean,
    movingRight: boolean,
};