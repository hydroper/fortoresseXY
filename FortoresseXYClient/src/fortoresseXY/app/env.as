package fortoresseXY.app {
    public var env: * = undefined;
}

import flash.utils.ByteArray;
import fortoresseXY.app.*;
fortoresseXY.app.env = JSON.parse((new PlainEnv() as ByteArray).toString());