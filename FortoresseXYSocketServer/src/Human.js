import { Body, Vector } from "matter-js";
import { PressButtonPacket, ButtonPacketType } from "./packets/PressButtonPacket";

const moveSpeed = 28;
const maxMoveSpeed = 32;
const jumpForce = 32;

export class Human {
    /**
     * @type {Body}
     */
    body;
    facingDirection = "right";
    isMoving = false;
    pose = "standing";

    /**
     * @param {Body} body
     */
    constructor(body) {
        this.body = body;
    }

    get facingLeft() {
        return this.facingDirection == "left";
    }

    set facingLeft(value) {
        this.facingDirection = value ? "left" : "right";
    }

    get facingRight() {
        return this.facingDirection == "right";
    }

    set facingRight(value) {
        this.facingDirection = value ? "right" : "left";
    }

    /**
     * @param {PressButtonPacket} packet 
     */
    handlePressButtonPacket(packet) {
        switch (packet.buttonType) {
            case ButtonPacketType.JUMP:
                if (!packet.releaseButton) {
                    this.jump();
                }
                break;
            case ButtonPacketType.MOVE_LEFT:
                if (packet.releaseButton) {
                    if (this.facingLeft) {
                        this.isMoving = false;
                        this.pose = HumanPoseType.STANDING;
                    }
                } else {
                    this.isMoving = true;
                    this.pose = HumanPoseType.MOVING;
                    this.facingLeft = true;
                }
                break;
            case ButtonPacketType.MOVE_RIGHT:
                if (packet.releaseButton) {
                    if (this.facingRight) {
                        this.isMoving = false;
                        this.pose = HumanPoseType.STANDING;
                    }
                } else {
                    this.isMoving = true;
                    this.pose = HumanPoseType.MOVING;
                    this.facingRight = true;
                }
                break;
            case ButtonPacketType.SIT:
                if (packet.releaseButton) {
                    if (!this.isMoving) {
                        this.pose = HumanPoseType.STANDING;
                    }
                } else {
                    this.pose = HumanPoseType.SITTING;
                }
                break;
        }
    }

    get flyingOrFalling() {
        const v = Body.getVelocity(this.body);
        return v.y < -0.25 || v.y > 0.25;
    }
    
    jump() {
        if (this.pose == HumanPoseType.JUMPING || this.flyingOrFalling) {
            return;
        }
        this.pose = HumanPoseType.JUMPING;
        Body.applyForce(this.body, this.body.position, Vector.create(0, -jumpForce));
    }

    move() {
        if (this.facingLeft && this.isMoving) {
            Body.applyForce(this.body, this.body.position, Vector.create(-moveSpeed, 0));
        } else if (this.facingRight && this.isMoving) {
            Body.applyForce(this.body, this.body.position, Vector.create(+moveSpeed, 0));
        }

        // Finish jumping
        if (this.pose == HumanPoseType.JUMPING && !this.flyingOrFalling) {
            this.pose = HumanPoseType.STANDING;
        }

        const v = Body.getVelocity(this.body);

        // Set maximum velocity
        Body.setVelocity(this.body, Vector.create(v.x < -maxMoveSpeed ? -maxMoveSpeed : v.x > +maxMoveSpeed ? +maxMoveSpeed : v.x, v.y));

        // Prevent rotation
        Body.setAngle(this.body, 0);
        Body.setAngularVelocity(this.body, 0);
    }
}

export const HumanPoseType = {
    STANDING: "standing",
    SITTING: "sitting",
    JUMPING: "jumping",
    MOVING: "moving",
};