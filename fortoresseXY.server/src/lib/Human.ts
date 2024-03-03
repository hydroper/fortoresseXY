import { Body, Vector } from "matter-js";
import { PressButtonPacket } from "fortoresseXY/packets/PressButtonPacket";

const moveSpeed: number = 28;
const maxMoveSpeed: number = 32;
const jumpForce: number = 32;

export class Human {
    public body: Body;
    private facingDirection: string = "right";
    public isMoving: boolean = false;
    public pose: HumanPoseType = "standing";

    public constructor(body: Body) {
        this.body = body;
    }

    public get facingLeft(): boolean {
        return this.facingDirection == "left";
    }

    public set facingLeft(value: boolean) {
        this.facingDirection = value ? "left" : "right";
    }

    public get facingRight(): boolean {
        return this.facingDirection == "right";
    }

    public set facingRight(value: boolean) {
        this.facingDirection = value ? "right" : "left";
    }

    public handlePressButtonPacket(packet: PressButtonPacket): void {
        switch (packet.buttonType) {
            case "jump":
                if (!packet.releaseButton) {
                    this.jump();
                }
                break;
            case "moveLeft":
                if (packet.releaseButton) {
                    if (this.facingLeft) {
                        this.isMoving = false;
                        this.pose = "standing";
                    }
                } else {
                    this.isMoving = true;
                    this.pose = "moving";
                    this.facingLeft = true;
                }
                break;
            case "moveRight":
                if (packet.releaseButton) {
                    if (this.facingRight) {
                        this.isMoving = false;
                        this.pose = "standing";
                    }
                } else {
                    this.isMoving = true;
                    this.pose = "moving";
                    this.facingRight = true;
                }
                break;
            case "sit":
                if (packet.releaseButton) {
                    if (!this.isMoving) {
                        this.pose = "standing";
                    }
                } else {
                    this.pose = "sitting";
                }
                break;
        }
    }

    public get flyingOrFalling(): boolean {
        const v = Body.getVelocity(this.body);
        return v.y < -0.25 || v.y > 0.25;
    }
    
    public jump(): void {
        if (this.pose == "jumping" || this.flyingOrFalling) {
            return;
        }
        this.pose = "jumping";
        Body.applyForce(this.body, this.body.position, Vector.create(0, -jumpForce));
    }

    public move(): void {
        if (this.facingLeft && this.isMoving) {
            Body.applyForce(this.body, this.body.position, Vector.create(-moveSpeed, 0));
        } else if (this.facingRight && this.isMoving) {
            Body.applyForce(this.body, this.body.position, Vector.create(+moveSpeed, 0));
        }

        // Finish jumping
        if (this.pose == "jumping" && !this.flyingOrFalling) {
            this.pose = "standing";
        }

        const v = Body.getVelocity(this.body);

        // Set maximum velocity
        Body.setVelocity(this.body, Vector.create(v.x < -maxMoveSpeed ? -maxMoveSpeed : v.x > +maxMoveSpeed ? +maxMoveSpeed : v.x, v.y));

        // Prevent rotation
        Body.setAngle(this.body, 0);
        Body.setAngularVelocity(this.body, 0);
    }
}

export type HumanPoseType =
    "standing"|
    "sitting" |
    "jumping" |
    "moving";