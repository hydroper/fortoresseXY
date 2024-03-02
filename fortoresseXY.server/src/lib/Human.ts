import { Body, Vector } from "matter-js";

const moveSpeed: number = 28;
const maxMoveSpeed: number = 32;

export class Human {
    public body: Matter.Body;
    public facingLeft: boolean = false;
    public facingRight: boolean = false;
    public sitting: boolean = false;
    public jumping: boolean = false;
    public movingLeft: boolean = false;
    public movingRight: boolean = false;

    public constructor(body: Body) {
        this.body = body;
    }

    public move(): void {
        if (this.movingLeft) {
            //
        } else if (this.movingRight) {
            //
        } else {
            //
        }

        const v = Body.getVelocity(this.body);

        // Finish jump
        if (this.jumping && v.y > -1 && v.y < 1) {
            this.jumping = false;
        }

        // Set maximum velocity
        Body.setVelocity(this.body, Vector.create(v.x < -maxMoveSpeed ? -maxMoveSpeed : v.x > maxMoveSpeed ? maxMoveSpeed : v.x, v.y));
    }
}