package feathers.graphics {
    import flash.display.*;
    import flash.geom.*;

    public function GradientFillStyle(type: String, colors: Array, alphas: Array, ratios: Array, matrix: Matrix = null, spreadMethod: String = SpreadMethod.PAD, interpolationMethod: String = InterpolationMethod.RGB, focalPointRatio: Number = 0): FillStyle {
        return new FillStyle("Gradient", 2, [type, colors, alphas, ratios, matrix, spreadMethod, interpolationMethod, focalPointRatio]);
    }
}