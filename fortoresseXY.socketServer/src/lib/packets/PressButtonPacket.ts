export type PressButtonPacket = {
    type: "pressButton",
    buttonType: ButtonPacketType,
    releaseButton: boolean,
};

export type ButtonPacketType =
    "moveLeft" |
    "moveRight" |
    "jump" |
    "sit";