const util = require("util");
const childProcess_exec = util.promisify(require("child_process").exec);
const changeDirectory = process.chdir;

class Main {
    constructor() {
        this.initialize();
    }

    async initialize() {
        changeDirectory("../FortoresseXYServer");
        await this.run("npm start");
    }

    /**
     * @param {string} command
     */
    async run(command) {
        try {
            const {stdout, stderr} = await childProcess_exec(command);
            console.log(stdout);
            console.log(stderr);
        } catch (error) {
            throw new Error(error.message);
        }
    }
}

new Main();