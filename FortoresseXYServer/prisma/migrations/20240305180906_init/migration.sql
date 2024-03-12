-- CreateTable
CREATE TABLE `IpUser` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `lastAccountCreationAttempt` DATETIME(3) NULL,
    `lastSignInFailure` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `emailIsVerified` BOOLEAN NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `accountCreation` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `look` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `User_username_key`(`username`),
    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Server` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `url` VARCHAR(191) NOT NULL,
    `isPrivate` BOOLEAN NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `serverCreation` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `descriptor` LONGBLOB NOT NULL,
    `script` LONGBLOB NOT NULL,

    UNIQUE INDEX `Server_url_key`(`url`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UserAuthoringServer` (
    `userId` BIGINT NOT NULL,
    `serverId` BIGINT NOT NULL,

    PRIMARY KEY (`userId`, `serverId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ServerProperty` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `serverId` BIGINT NOT NULL,
    `propertyName` VARCHAR(191) NOT NULL,
    `propertyValue` LONGBLOB NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ServerUserProperty` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `serverId` BIGINT NOT NULL,
    `userId` BIGINT NOT NULL,
    `propertyName` VARCHAR(191) NOT NULL,
    `propertyValue` LONGBLOB NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `UserAuthoringServer` ADD CONSTRAINT `UserAuthoringServer_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserAuthoringServer` ADD CONSTRAINT `UserAuthoringServer_serverId_fkey` FOREIGN KEY (`serverId`) REFERENCES `Server`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ServerProperty` ADD CONSTRAINT `ServerProperty_serverId_fkey` FOREIGN KEY (`serverId`) REFERENCES `Server`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ServerUserProperty` ADD CONSTRAINT `ServerUserProperty_serverId_fkey` FOREIGN KEY (`serverId`) REFERENCES `Server`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ServerUserProperty` ADD CONSTRAINT `ServerUserProperty_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
