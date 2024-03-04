import "dotenv/config";
import express from "express";

class FortoresseXYServer {
    private application: express.Application;

    public constructor() {
        this.application = express();
        this.application.listen(process.env.PORT);
    }
}

new FortoresseXYServer();