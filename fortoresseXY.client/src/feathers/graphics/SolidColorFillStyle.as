package feathers.graphics {
    public function SolidColorFillStyle(color: int, alpha: Number = 1): FillStyle {
        return new FillStyle("SolidColor", 0, [color, alpha]);
    }
}