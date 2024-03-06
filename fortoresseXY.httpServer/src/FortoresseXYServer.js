import "dotenv/config";
import "./prisma";
import express from "express";
import cors from "cors";
import { SocketAPI } from "./socketAPI/SocketAPI";

class FortoresseXYServer {
    application;

    constructor() {
        this.application = express();

        // Enable Cross-Origin Resource Sharing
        this.application.use(cors({
            origin: "*"
        }));

        // Socket API
        new SocketAPI(this.application);

        this.application.listen(process.env.PORT);
    }
}

new FortoresseXYServer();