package feathers.graphics {
    import flash.display.*;
    import flash.geom.*;

    public function BitmapFillStyle(bitmapData: BitmapData, matrix: Matrix = null, repeat: Boolean = false, smoothing: Boolean = true): FillStyle {
        return new FillStyle("Bitmap", 1, [bitmapData, matrix, repeat, smoothing]);
    }
}