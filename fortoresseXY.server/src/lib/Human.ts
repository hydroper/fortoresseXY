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
        if (this.movingLeft && !this.sitting) {
            Body.applyForce(this.body, this.body.position, Vector.create(-moveSpeed, 0));
        } else if (this.movingRight && !this.sitting) {
            Body.applyForce(this.body, this.body.position, Vector.create(+moveSpeed, 0));
        }

        const v = Body.getVelocity(this.body);

        // Finish jumping
        if (this.jumping && v.y > -1 && v.y < 1) {
            this.jumping = false;
        }

        // Set maximum velocity
        Body.setVelocity(this.body, Vector.create(v.x < -maxMoveSpeed ? -maxMoveSpeed : v.x > +maxMoveSpeed ? +maxMoveSpeed : v.x, v.y));

        // Prevent rotation
        Body.setAngle(this.body, 0);
        Body.setAngularVelocity(this.body, 0);
    }
}