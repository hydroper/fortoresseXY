package feathers.graphics {
    import feathers.graphics._CreateGradientBoxMatrix.CreateGradientBoxMatrix_Impl_;

    public final class CreateGradientBoxMatrix {
        public static function fromDegrees(degrees: Number): Function {
            return CreateGradientBoxMatrix_Impl_.fromRadians(degrees * Math.PI / 180);
        }
    }
}