package fortoresseXY.fonts {
    import flash.text.Font;

    public class FortoresseXYFonts {
        [Embed(
            source = "./notoSans/NotoSans-Regular.ttf",
            fontName = "Noto Sans",
            fontWeight = "normal",
            fontStyle = "normal",
            mimeType = "application/x-font",
            advancedAntiAliasing = "true",
            embedAsCFF = "false"
        )]
        public static const notoSansRegular: Class;

        [Embed(
            source = "./notoSans/NotoSans-Italic.ttf",
            fontName = "Noto Sans",
            fontWeight = "normal",
            fontStyle = "italic",
            mimeType = "application/x-font",
            advancedAntiAliasing = "true",
            embedAsCFF = "false"
        )]
        public static const notoSansItalic: Class;

        [Embed(
            source = "./notoSans/NotoSans-Bold.ttf",
            fontName = "Noto Sans",
            fontWeight = "bold",
            fontStyle = "normal",
            mimeType = "application/x-font",
            advancedAntiAliasing = "true",
            embedAsCFF = "false"
        )]
        public static const notoSansBold: Class;

        [Embed(
            source = "./notoSans/NotoSans-BoldItalic.ttf",
            fontName = "Noto Sans",
            fontWeight = "bold",
            fontStyle = "italic",
            mimeType = "application/x-font",
            advancedAntiAliasing = "true",
            embedAsCFF = "false"
        )]
        public static const notoSansBoldItalic: Class;

        [Embed(
            source = "./notoSans/NotoSans-ExtraLight.ttf",
            fontName = "Noto Sans ExtraLight",
            fontWeight = "0",
            fontStyle = "normal",
            mimeType = "application/x-font",
            advancedAntiAliasing = "true",
            embedAsCFF = "false"
        )]
        public static const notoSansExtraLight: Class;

        [Embed(
            source = "./notoSans/NotoSans-ExtraLightItalic.ttf",
            fontName = "Noto Sans ExtraLight",
            fontWeight = "0",
            fontStyle = "italic",
            mimeType = "application/x-font",
            advancedAntiAliasing = "true",
            embedAsCFF = "false"
        )]
        public static const notoSansExtraLightItalic: Class;

        public static function register(): void {
            Font.registerFont(notoSansRegular);
            Font.registerFont(notoSansItalic);
            Font.registerFont(notoSansBold);
            Font.registerFont(notoSansBoldItalic);
            Font.registerFont(notoSansExtraLight);
            Font.registerFont(notoSansExtraLightItalic);
        }
    }
}