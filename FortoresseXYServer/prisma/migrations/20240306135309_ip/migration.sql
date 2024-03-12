/*
  Warnings:

  - A unique constraint covering the columns `[address]` on the table `IpUser` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `address` to the `IpUser` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `ipuser` ADD COLUMN `address` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `IpUser_address_key` ON `IpUser`(`address`);
