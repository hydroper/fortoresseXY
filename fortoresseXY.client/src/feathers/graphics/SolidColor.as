package feathers.graphics {
    public function SolidColor(arg1: int, arg2: Number = NaN): FillStyle {
        return new FillStyle("SolidColor", 0, [isNaN(arg2) ? 1 : arg2, arg1]);
    }
}