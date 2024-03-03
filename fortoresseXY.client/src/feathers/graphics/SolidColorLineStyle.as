package feathers.graphics {
    import flash.display.*;

    public function SolidColorLineStyle(thickness: Number, color: int, alpha: Number = 1, pixelHinting: Boolean = false, scaleMode: String = LineScaleMode.NORMAL, caps: String = null, joints: String = null, miterLimit: Number = 3): LineStyle {
        return new LineStyle("SolidColor", 0, [thickness, color, alpha, pixelHinting, scaleMode, caps, joints, ]);
    }
}