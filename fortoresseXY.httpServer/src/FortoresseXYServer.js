import "dotenv/config";
import "./prisma";
import express from "express";
import cors from "cors";

class FortoresseXYServer {
    application;

    constructor() {
        this.application = express();

        // Enable Cross-Origin Resource Sharing
        this.application.use(cors({
            origin: "*"
        }));

        this.application.listen(process.env.PORT);
    }
}

new FortoresseXYServer();