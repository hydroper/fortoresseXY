export class SocketAPI {
    application;

    /**
     * @param {import("express").Application} application 
     */
    constructor(application) {
        this.application = application;
    }
}