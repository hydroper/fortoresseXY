import { HumanPoseType } from "../Human";

/**
 * @typedef WorldPacket
 * @property {"world"} type
 * @property {WorldPacketHumanEntity[]} entities
 */

export const WorldPacketEntityType = {
    HUMAN: "human",
};

/**
 * @typedef WorldPacketHumanEntity
 * @property {"human"} type
 * @property {string} playerId
 * @property {number} x
 * @property {number} y
 * @property {boolean} facingLeft
 * @property {boolean} facingRight
 * @property {string} pose - `HumanPoseType` constant
 */