<p align="center">
  <img src="./assets/banner.png">
</p>

Fortoresse XY is an open world, 2D shooter multiplayer game in early development.

## Status

The work is going variable on this project. I've almost gave up due to lack of interest and some technology considerations, but I'm considering returning to it, although difficultly due to lack of type annotations in JavaScript.

I hope that futurely the [Types as Comments](https://github.com/tc39/proposal-type-annotations) proposal will be realized in ECMAScript and implemented in V8, facilitating the server side projects of Fortoresse XY.

Right now, it is being stressing to, for example, type `/** @type {T} */` for every property. I had the choice of abandoning TypeScript. I had initially started a TypeScript project in this project and got a version conflict when installing the `cors` NPM package. I could have forked the `cors` repository to fix it, but for some reason I did not want to do it, and ended up converting all my code to not use TypeScript. I don't know, maybe I could consider reversing the changes and fork `cors`, but not sure if this is good?

## Origins

Fortoresse XY inspires from the original Fortoresse game by the Atelier 801 company. There are several differences planned:

* Crossing endpoints of a level would lead to another level.
* Pixel buildings would be substituted by higher buildings, such as breakable shields and slopes.
* The game is composed of user servers.

Planned features:

* User servers
  * Scripting

## Discussions

Use the [discussion forum](https://github.com/hydroper/fortoresseXY/discussions) available in this repository to discuss and share ideas.

## Environment setup

* For the client side project, do the following steps:
  * Copy the **.env-example.txt** file into a new **.env.txt** file.
  * Assign the environment variables in that .env.txt file properly.
* For each of the server side projects, do the following steps:
  * Copy the **.env-example** file into a new **.env** file.
  * Assign the environment variables in that .env file properly.
* Setup the server side by running the following commands:

```sh
cd FortoresseXYServer
npm install
npx prisma generate
```

* Setup the socket server side by running the following commands:

```sh
cd ../FortoresseXYSocketServer
npm install
```

## Client side

The client side is currently beginning and uses:

* [Samsung HARMAN AIR](https://airsdk.dev)
  * AIR supports native WebSocket as of 2024. [Download AIR SDK 51.0.](https://airsdk.harman.com/download/51.0.0.2)
* [Feathers UI](https://feathersui.com) — OpenFL SWC for ActionScript 3

Expected tools:

* Adobe Animate for graphics assets.

[![](https://img.shields.io/badge/AIR-gray)](https://airsdk.dev)
[![](https://img.shields.io/badge/Feathers%20UI-gray)](https://feathersui.com)
[![](https://img.shields.io/badge/Agera-gray)](https://hydroper.gitbook.io/agera-air)
[![](https://img.shields.io/badge/com.eclecticdesignstudio.motion-gray)](https://github.com/agera-air/com.eclecticdesignstudio.motion)

<!--

Client side reconsiderations:

* No use of Apache Flex or Apache Royale, given that both are not priorized over the Feathers UI project by Josh Tynjala. The reason is that Josh builds a SWC for every Feathers UI release, which is compatible with AIR applications written in ActionScript 3.
* If the project were to use Apache Flex, then the AIR SDK overlay would be overlaid into the Apache Flex SDK.

[![](https://img.shields.io/badge/Flex-gray)](https://flex.apache.org)
[![](https://img.shields.io/badge/Using%20Flex-gray)](https://help.adobe.com/archive/en_US/flex/using/flex_4.6_help.pdf)
[![](https://img.shields.io/badge/Flex%20Tricks-gray)](https://gist.github.com/hydroper/8b70e8877b1bb7360528d6c5eae50d08)

-->

Requirements:

* [AIR SDK](https://airsdk.dev/docs/basics/getting-started)
* [Node.js](https://nodejs.org)
* Install `asconfigc` through the command `npm i -g asconfigc`

Debug the client through the following commands:

* Windows: Command Prompt

```batch
run\debug-client
```

* Unix Shell

```bash
./run/debug-client.sh
```

## Database

The server side is responsible for communicating with the Fortoresse XY's database. It is oriented to MySQL, but may use any other data source provider.

* Install [Apache XAMPP](https://www.apachefriends.org) for local debugging, which provides a MySQL installation in hands and phpMyAdmin for MySQL database management.
* Initial XAMPP MySQL database URL: `mysql://root@localhost:3306/fortoressexy`.
* Public MySQL database URL: `mysql://username:password@host.com:port/fortoressexy`.
* The server side project uses the [Prisma ORM](https://www.prisma.io/docs/orm).

[![](https://img.shields.io/badge/Prisma-gray)](https://www.prisma.io/docs/orm)

Initiate the database by running the following commands:

```sh
cd FortoresseXYServer
npx prisma migrate dev
```

## Server side

Run the server through the following commands:

* Windows: Command Prompt

```batch
run\run-server
```

* Unix Shell

```bash
./run/run-server.sh
```

### Socket server side

The socket server side (`FortoresseXYSocketServer`) is launched when a server is instantiated by at least one player. The list of active socket servers is managed by the server side.

The socket server side uses Node.js and is still beginning.

[![](https://img.shields.io/badge/JSDoc-gray)](https://jsdoc.app)
[![](https://img.shields.io/badge/Matter%20Physics-gray)](https://brm.io/matter-js)
[![](https://img.shields.io/badge/WebSocket-gray)](https://www.npmjs.com/package/ws)

### Primary server side

The primary server side (`FortoresseXYServer`) uses Node.js and is still beginning.

[![](https://img.shields.io/badge/JSDoc-gray)](https://jsdoc.app)
[![](https://img.shields.io/badge/Prisma-gray)](https://www.prisma.io/docs/orm)