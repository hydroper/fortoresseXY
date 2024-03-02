# Fortoresse XY

Fortoresse XY is a free world, 2D shooter multiplayer game in early development.

## Origin

Fortoresse XY has its roots from the original Fortoresse game by the Atelier 801 company. There are several differences planned:

* Crossing endpoints of a level would lead to another level.
* Pixel buildings would be substituted by higher buildings, such as breakable shields and slopes.

Planned features:

* Native servers
* User servers
  * Scripting

## Discussions

Use the [discussion forum](https://github.com/hydroper/fortoresseXY/discussions) available in this repository to discuss and share ideas.

## Client side

The client side is currently empty, but will use:

* [Samsung HARMAN AIR](https://airsdk.dev)
  * The AIR SDK overlay is overlaid into the Apache Flex SDK.
  * AIR supports native WebSocket as of 2024.
* [Apache Flex](https://flex.apache.org)

Expected tools:

* Adobe Animate for graphics assets.

[![](https://img.shields.io/badge/AIR-gray)](https://airsdk.dev)
[![](https://img.shields.io/badge/Flex-gray)](https://flex.apache.org)
[![](https://img.shields.io/badge/Using%20Flex-gray)](https://help.adobe.com/archive/en_US/flex/using/flex_4.6_help.pdf)
[![](https://img.shields.io/badge/Flex%20Tricks-gray)](https://gist.github.com/hydroper/8b70e8877b1bb7360528d6c5eae50d08)
[![](https://img.shields.io/badge/Agera-gray)](https://hydroper.gitbook.io/agera-air)

## Server side

The server side uses Node.js and is still beginning. It uses:

* [Matter.js](https://brm.io/matter-js/) (physics simulation)
* [`ws`](https://www.npmjs.com/package/ws) (WebSocket server)

The database is still undecided.