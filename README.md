# Fortoresse XY

A multiplayer game beginning development. It will take the form of the Atelier 801's Fortoresse game, however it will function vastly differently.

It is preceded by the failed attempt of another multiplayer game.

## Discussions

Use the [discussion forum](https://github.com/hydroper/fortoresseXY/discussions) available in this repository to discuss and share ideas.

## Client side

The client side is currently empty, but will use:

* [Adobe AIR](https://airsdk.dev)
* [Apache Flex](https://flex.apache.org)

Adobe AIR added native WebSocket support recently, and Adobe Animate will be used for developing movie clips.

Framework documentation:

* [AIR SDK site](https://airsdk.dev)
* [Apache Flex site](https://flex.apache.org)
* [Using Flex](https://help.adobe.com/archive/en_US/flex/using/flex_4.6_help.pdf)
* [Flex tricks](https://gist.github.com/hydroper/8b70e8877b1bb7360528d6c5eae50d08)
* [Agera for AIR: utilities](https://hydroper.gitbook.io/agera-air/)

## Server side

The server side uses Node.js and is still beginning. It uses:

* [Matter.js](https://brm.io/matter-js/) (physics simulation)
* [`ws`](https://www.npmjs.com/package/ws) (WebSocket server)

The database is still undecided.