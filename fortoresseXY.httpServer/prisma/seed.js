import "dotenv/config";
import { PrismaClient } from "@prisma/client";
import { createHmac } from "crypto";

const prisma = new PrismaClient();

async function seed() {
    const hydroper = await prisma.user.upsert({
        where: {
            username: "hydroper",
        },
        update: {},
        create: {
            username: "hydroper",
            email: "matheusdiasdesouzads@gmail.com",
            password: await encryptHS256("123", process.env.SECRET_KEY),
            look: "",
            emailIsVerified: true,
        },
    });

    console.log(hydroper);
}

/**
 * @param {string} data
 * @param {string} secret
 * @returns {Promise<string>}
 */
function encryptHS256(data, secret) {
    return new Promise((resolve, reject) => {
        const hmac = createHmac("sha256", secret);
        hmac.on("readable", () => {
            const data = hmac.read();
            if (data) {
                resolve(data.toString("hex"));
            }
        });
        hmac.on("error", error => {
            reject(error);
        });
        hmac.write(data);
        hmac.end();
    });
}

seed()
    .then(async _ => {
        await prisma.$disconnect();
    })
    .catch(async (error) => {
        console.error(error);
        await prisma.$disconnect();
        process.exit(1);
    });