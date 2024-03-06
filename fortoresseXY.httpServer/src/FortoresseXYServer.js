import "dotenv/config";
import "./prisma";
import express from "express";
import cors from "cors";
import { SocketAPI } from "./socketAPI/SocketAPI";
import { Ipware } from "@fullerstack/nax-ipware";
import { splitAddressListString } from "./util/splitAddressListString";

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
        const trustedProxies = splitAddressListString(process.env.TRUSTED_PROXIES);
        const privateIpPrefixes = splitAddressListString(process.env.PRIVATE_IP_PREFIXES);

        this.application.use((request, response, next) => {
            request.ipInfo = ipware.getClientIP(request, {
                privateIpPrefixes,
                proxy: {
                    count,
                    proxyList: trustedProxies,
                },
            });
            next();
        });
    }
}

new FortoresseXYServer();