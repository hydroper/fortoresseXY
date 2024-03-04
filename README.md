<p align="center">
  <img src="./assets/banner.png">
</p>

Fortoresse XY is a free world, 2D shooter multiplayer game in early development.

## Origins

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

Client side reconsiderations:

* No use of Apache Flex or Apache Royale, given that both are not priorized over the Feathers UI project by Josh Tynjala. The reason is that Josh builds a SWC for every Feathers UI release, which is compatible with AIR applications written in ActionScript 3.
* If the project were to use Apache Flex, then the AIR SDK overlay would be overlaid into the Apache Flex SDK.

[![](https://img.shields.io/badge/Flex-gray)](https://flex.apache.org)
[![](https://img.shields.io/badge/Using%20Flex-gray)](https://help.adobe.com/archive/en_US/flex/using/flex_4.6_help.pdf)
[![](https://img.shields.io/badge/Flex%20Tricks-gray)](https://gist.github.com/hydroper/8b70e8877b1bb7360528d6c5eae50d08)

Requirements:

* AIR SDK
* Node.js
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

Planning out:

* Consider using MySQL. Install [Apache XAMPP](https://www.apachefriends.org) for local debugging, which provides a MySQL installation in hands.
* Nothing covered about migrations
* Nothing covered about seeding

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

The socket server side uses Node.js and is still beginning.

[![](https://img.shields.io/badge/Matter%20Physics-gray)](https://brm.io/matter-js)
[![](https://img.shields.io/badge/WebSocket-gray)](https://www.npmjs.com/package/ws)

### HTTP server side

The HTTP server side uses Node.js and is currently empty.