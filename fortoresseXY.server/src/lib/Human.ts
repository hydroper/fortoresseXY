import { Body, Vector } from "matter-js";

const moveSpeed: number = 28;
const maxMoveSpeed: number = 32;

export class Human {
    public body: Matter.Body;
    public facingLeft: boolean = false;
    public facingRight: boolean = false;
    public isMoving: boolean = false;
    public pose: HumanPoseType = "standing";

    public constructor(body: Body) {
        this.body = body;
    }

    public move(): void {
        if (this.facingLeft && this.isMoving) {
            Body.applyForce(this.body, this.body.position, Vector.create(-moveSpeed, 0));
        } else if (this.facingRight && this.isMoving) {
            Body.applyForce(this.body, this.body.position, Vector.create(+moveSpeed, 0));
        }

        const v = Body.getVelocity(this.body);

        // Finish jumping
        if (this.pose == "jumping" && v.y > -1 && v.y < 1) {
            this.pose = "standing";
        }

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