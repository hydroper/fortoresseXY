package fortoresseXY.themes {
    import feathers.themes.steel.SteelTheme;
    import feathers.controls.*;
    import feathers.skins.*;
    import feathers.graphics.*;
    import feathers.text.*;
    import flash.display.*;
    import flash.geom.Matrix;

    public class FortoresseXYTheme extends SteelTheme {
        private static const FortoresseXYTheme_foreground: Number = 0xFFFFFF;
        private static const FortoresseXYTheme_background: Number = 0x585858;
        private static const FortoresseXYTheme_danger: Number = 0xFF9999;
        private static const FortoresseXYTheme_backgroundTop: Number = 0x577A87;
        private static const FortoresseXYTheme_backgroundBottom: Number = FortoresseXYTheme_background;

        public function FortoresseXYTheme() {
            super();
            this.fontSize = 24;
            this.headerFontSize = 34;

            this.styleProvider.setStyleFunction(Panel, null, setPanelStyles);
            this.styleProvider.setStyleFunction(Button, Button.VARIANT_PRIMARY, setPrimaryButtonStyles);
            this.styleProvider.setStyleFunction(Button, null, setSecondaryButtonStyles);
            this.styleProvider.setStyleFunction(Button, Button.VARIANT_DANGER, setDangerButtonStyles);
        }

        private function createBackgroundGradientFill1(): FillStyle {
            return GradientFillStyle(GradientType.LINEAR, [FortoresseXYTheme_backgroundTop, FortoresseXYTheme_background], [1.0, 1.0], [10, 200], CreateGradientBoxMatrix.fromDegrees(90));
        }

        private function setPanelStyles(panel: Panel): void {
            const backgroundSkin: RectangleSkin = new RectangleSkin();
            backgroundSkin.border = null;
            backgroundSkin.fill = this.createBackgroundGradientFill1();
            panel.backgroundSkin = backgroundSkin;
        }

        private function setPrimaryButtonStyles(button: Button): void {
            // Default
            button.setPadding(20);
            button.textFormat = this.getTextFormat();
            button.textFormat.color = FortoresseXYTheme_background;
            var backgroundSkin: RectangleSkin = new RectangleSkin();
            backgroundSkin.border = SolidColorLineStyle(4, FortoresseXYTheme_foreground);
            backgroundSkin.fill = SolidColorFillStyle(FortoresseXYTheme_foreground);
            backgroundSkin.cornerRadius = 50;
            button.backgroundSkin = backgroundSkin;

            // Disabled
            backgroundSkin.setBorderForState(ButtonState.DISABLED, SolidColorLineStyle(4, FortoresseXYTheme_foreground, 0.5));
            backgroundSkin.setFillForState(ButtonState.DISABLED, SolidColorFillStyle(FortoresseXYTheme_foreground, 0.5));

            // Hover
            backgroundSkin.setBorderForState(ButtonState.HOVER, SolidColorLineStyle(4, FortoresseXYTheme_foreground, 0.5));
            backgroundSkin.setFillForState(ButtonState.HOVER, SolidColorFillStyle(FortoresseXYTheme_foreground, 0.7));
        }

        private function setSecondaryButtonStyles(button: Button): void {
            // Default
            button.setPadding(20);
            button.textFormat = this.getTextFormat();
            button.textFormat.color = FortoresseXYTheme_foreground;
            var backgroundSkin: RectangleSkin = new RectangleSkin();
            backgroundSkin.border = SolidColorLineStyle(4, FortoresseXYTheme_foreground);
            backgroundSkin.fill = SolidColorFillStyle(0x000000, 0);
            backgroundSkin.cornerRadius = 50;
            button.backgroundSkin = backgroundSkin;

            // Disabled
            backgroundSkin.setBorderForState(ButtonState.DISABLED, SolidColorLineStyle(4, FortoresseXYTheme_foreground, 0.5));
            button.disabledAlpha = 0.5;

            // Hover
            backgroundSkin.setBorderForState(ButtonState.HOVER, SolidColorLineStyle(4, FortoresseXYTheme_foreground, 0.7));
        }

        private function setDangerButtonStyles(button: Button): void {
            // Default
            button.setPadding(20);
            button.textFormat = this.getTextFormat();
            button.textFormat.color = FortoresseXYTheme_background;
            var backgroundSkin: RectangleSkin = new RectangleSkin();
            backgroundSkin.border = SolidColorLineStyle(4, FortoresseXYTheme_danger);
            backgroundSkin.fill = SolidColorFillStyle(FortoresseXYTheme_danger);
            backgroundSkin.cornerRadius = 50;
            button.backgroundSkin = backgroundSkin;

            // Disabled
            backgroundSkin.setBorderForState(ButtonState.DISABLED, SolidColorLineStyle(4, FortoresseXYTheme_danger, 0.5));
            backgroundSkin.setFillForState(ButtonState.DISABLED, SolidColorFillStyle(FortoresseXYTheme_danger, 0.5));

            // Hover
            backgroundSkin.setBorderForState(ButtonState.HOVER, SolidColorLineStyle(4, FortoresseXYTheme_danger, 0.7));
            backgroundSkin.setFillForState(ButtonState.HOVER, SolidColorFillStyle(FortoresseXYTheme_danger, 0.7));
        }
    }
}