import { createHmac } from "crypto";

/**
 * @param {string} data
 * @param {string} secret
 * @returns {Promise<string>}
 */
export function encryptHS256(data, secret) {
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