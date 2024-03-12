import { PrismaClient } from "@prisma/client";
import assert from "assert";

export const prisma = new PrismaClient();

/**
 * @param {Function} callback 
 */
export async function prismaAction(callback) {
    const result = callback();
    assert(result instanceof Promise);
    try {
        return await result;
    } catch (error) {
        console.error(error);
        await prisma.$disconnect();
        process.exit(1);
    }
}

process.on("beforeExit", () => {
    prisma.$disconnect();
})