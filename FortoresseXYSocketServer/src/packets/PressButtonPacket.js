/**
 * @typedef PressButtonPacket
 * @property {"pressButton"} type
 * @property {string} buttonType - `ButtonPacketType` constant
 * @property {boolean} releaseButton
 */

export const ButtonPacketType = {
    MOVE_LEFT: "moveLeft",
    MOVE_RIGHT: "moveRight",
    JUMP: "jump",
    SIT: "sit",
};