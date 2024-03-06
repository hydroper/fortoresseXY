import "dotenv/config";
import "./prisma";
import express from "express";
import cors from "cors";
import { SocketAPI } from "./socketAPI/SocketAPI";
import { Ipware } from "@fullerstack/nax-ipware";
import { splitListString } from "./util/splitListString";

const ipware = new Ipware();

class FortoresseXYServer {
    application;

    constructor() {
        this.application = express();

        // Enable Cross-Origin Resource Sharing
        this.application.use(cors({
            origin: "*"
        }));

        // Retrieve request IP
        this.retrieveRequestIP();

        // Socket API
        new SocketAPI(this.application);

        this.application.listen(process.env.PORT);
    }

    retrieveRequestIP() {
        const trustedProxies = splitListString(process.env.TRUSTED_PROXIES);

        this.application.use((request, response, next) => {
            request.ipInfo = ipware.getClientIP(request, {
                proxy: {
                    proxyList: trustedProxies,
                },
            });
            next();
        });
    }
}

new FortoresseXYServer();