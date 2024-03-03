package fortoresseXY.themes {
    import feathers.themes.steel.SteelTheme;
    import feathers.controls.*;
    import feathers.skins.*;
    import feathers.graphics.*;
    import feathers.text.*;
    import flash.display.*;
    import flash.geom.Matrix;

    public class FortoresseXYTheme extends SteelTheme {
        public function FortoresseXYTheme() {
            super();
            this.fontSize = 24;
            this.headerFontSize = 34;

            this.styleProvider.setStyleFunction(Panel, null, setPanelStyles);
            // this.styleProvider.setStyleFunction(Button, null, setButtonStyles);
        }

        private function createBackgroundGradientFill1(): FillStyle {
            return GradientFillStyle(GradientType.LINEAR, [0x577A87, 0x585858], [1.0, 1.0], [10, 200], CreateGradientBoxMatrix.fromDegrees(90));
        }

        private function setPanelStyles(panel: Panel): void {
            const backgroundSkin: RectangleSkin = new RectangleSkin();
            backgroundSkin.border = null;
            backgroundSkin.fill = this.createBackgroundGradientFill1();
            panel.backgroundSkin = backgroundSkin;
        }

        private function setButtonStyles(button: Button): void {
        }
    }
}