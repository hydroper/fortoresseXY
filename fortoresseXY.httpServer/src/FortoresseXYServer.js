import "dotenv/config";
import "./prisma";
import express from "express";

class FortoresseXYServer {
    application;

    constructor() {
        this.application = express();
        this.application.listen(process.env.PORT);
    }
}

new FortoresseXYServer();