package fortoresseXY.themes {
    import feathers.themes.steel.SteelTheme;
    import feathers.controls.*;
    import feathers.skins.*;
    import feathers.graphics.*;
    import feathers.text.*;
    import flash.display.*;
    import flash.geom.*;
    import fortoresseXY.fonts.*;

    public class FortoresseXYTheme extends SteelTheme {
        private static const FortoresseXYTheme_foreground: Number = 0xFFFFFF;
        private static const FortoresseXYTheme_background: Number = 0x585858;
        private static const FortoresseXYTheme_danger: Number = 0xFF9999;
        private static const FortoresseXYTheme_backgroundTop: Number = 0x577A87;
        private static const FortoresseXYTheme_backgroundBottom: Number = FortoresseXYTheme_background;
        private static const FortoresseXYTheme_focus: Number = 0x7084EE;

        public function FortoresseXYTheme() {
            super();
            FortoresseXYFonts.register();
            this.fontSize = 20;
            this.headerFontSize = 34;

            this.styleProvider.setStyleFunction(Panel, null, setPanelStyles);

            this.styleProvider.setStyleFunction(Button, Button.VARIANT_PRIMARY, setPrimaryButtonStyles);
            this.styleProvider.setStyleFunction(Button, null, setSecondaryButtonStyles);
            this.styleProvider.setStyleFunction(Button, Button.VARIANT_DANGER, setDangerButtonStyles);

            this.styleProvider.setStyleFunction(Label, Label.VARIANT_HEADING, setHeadingLabelStyles);

            this.styleProvider.setStyleFunction(TextInput, null, setTextInputStyles);
        }

        override public function getTextFormat(align: String = null): TextFormat {
            const tf: TextFormat = super.getTextFormat(align);
            tf.font = "Noto Sans";
            return tf;
        }

        private function getHeadingTextFormat(align: String = null): TextFormat {
            const tf: TextFormat = this.getTextFormat(align);
            tf.font = "XNoto Sans ExtraLight";
            tf.size = this.headerFontSize;
            return tf;
        }

        private function createBackgroundGradientFill1(): FillStyle {
            return FillStyle.Gradient(GradientType.LINEAR, [FortoresseXYTheme_backgroundTop, FortoresseXYTheme_background], [1.0, 1.0], [10, 200], CreateGradientBoxMatrix.fromDegrees(90));
        }

        private function setPanelStyles(panel: Panel): void {
            const backgroundSkin: RectangleSkin = new RectangleSkin();
            backgroundSkin.border = null;
            backgroundSkin.fill = this.createBackgroundGradientFill1();
            panel.backgroundSkin = backgroundSkin;
        }

        private function setPrimaryButtonStyles(button: Button): void {
            // Default
            button.paddingLeft = button.paddingRight = 20, button.paddingTop = button.paddingBottom = 8;
            button.textFormat = this.getTextFormat();
            button.textFormat.color = FortoresseXYTheme_background;
            var backgroundSkin: RectangleSkin = new RectangleSkin();
            backgroundSkin.border = LineStyle.SolidColor(4, FortoresseXYTheme_foreground);
            backgroundSkin.fill = FillStyle.SolidColor(FortoresseXYTheme_foreground);
            backgroundSkin.cornerRadius = 50;
            button.backgroundSkin = backgroundSkin;

            // Disabled
            backgroundSkin.setBorderForState(ButtonState.DISABLED, LineStyle.SolidColor(4, FortoresseXYTheme_foreground, 0.2));
            backgroundSkin.setFillForState(ButtonState.DISABLED, FillStyle.SolidColor(FortoresseXYTheme_foreground, 0.5));

            // Hover
            backgroundSkin.setBorderForState(ButtonState.HOVER, LineStyle.SolidColor(4, FortoresseXYTheme_foreground, 0.4));
            backgroundSkin.setFillForState(ButtonState.HOVER, FillStyle.SolidColor(FortoresseXYTheme_foreground, 0.7));

            // Down
            backgroundSkin.setBorderForState(ButtonState.DOWN, LineStyle.SolidColor(4, FortoresseXYTheme_foreground, 0.4));
            backgroundSkin.setFillForState(ButtonState.DOWN, FillStyle.SolidColor(FortoresseXYTheme_foreground, 0.7));

            // Focus
            button.setFocusPadding(5);
            var focusRectSkin: RectangleSkin = new RectangleSkin();
            focusRectSkin.cornerRadius = 5;
            focusRectSkin.border = LineStyle.SolidColor(4, FortoresseXYTheme_focus);
            button.focusRectSkin = focusRectSkin;
        }

        private function setSecondaryButtonStyles(button: Button): void {
            // Default
            button.paddingLeft = button.paddingRight = 20, button.paddingTop = button.paddingBottom = 8;
            button.textFormat = this.getTextFormat();
            button.textFormat.color = FortoresseXYTheme_foreground;
            var backgroundSkin: RectangleSkin = new RectangleSkin();
            backgroundSkin.border = LineStyle.SolidColor(4, FortoresseXYTheme_foreground);
            backgroundSkin.fill = FillStyle.SolidColor(0x000000, 0);
            backgroundSkin.cornerRadius = 50;
            button.backgroundSkin = backgroundSkin;

            // Disabled
            backgroundSkin.setBorderForState(ButtonState.DISABLED, LineStyle.SolidColor(4, FortoresseXYTheme_foreground, 0.5));
            button.disabledAlpha = 0.5;

            // Hover
            backgroundSkin.setFillForState(ButtonState.HOVER, FillStyle.SolidColor(FortoresseXYTheme_foreground, 0.15));

            // Down
            backgroundSkin.setFillForState(ButtonState.DOWN, FillStyle.SolidColor(FortoresseXYTheme_foreground, 0.15));

            // Focus
            button.setFocusPadding(5);
            var focusRectSkin: RectangleSkin = new RectangleSkin();
            focusRectSkin.cornerRadius = 5;
            focusRectSkin.border = LineStyle.SolidColor(4, FortoresseXYTheme_focus);
            button.focusRectSkin = focusRectSkin;
        }

        private function setDangerButtonStyles(button: Button): void {
            // Default
            button.paddingLeft = button.paddingRight = 20, button.paddingTop = button.paddingBottom = 8;
            button.textFormat = this.getTextFormat();
            button.textFormat.color = FortoresseXYTheme_background;
            var backgroundSkin: RectangleSkin = new RectangleSkin();
            backgroundSkin.border = LineStyle.SolidColor(4, FortoresseXYTheme_danger);
            backgroundSkin.fill = FillStyle.SolidColor(FortoresseXYTheme_danger);
            backgroundSkin.cornerRadius = 50;
            button.backgroundSkin = backgroundSkin;

            // Disabled
            backgroundSkin.setBorderForState(ButtonState.DISABLED, LineStyle.SolidColor(4, FortoresseXYTheme_danger, 0.4));
            backgroundSkin.setFillForState(ButtonState.DISABLED, FillStyle.SolidColor(FortoresseXYTheme_danger, 0.5));

            // Hover
            backgroundSkin.setBorderForState(ButtonState.HOVER, LineStyle.SolidColor(4, FortoresseXYTheme_danger, 0.4));
            backgroundSkin.setFillForState(ButtonState.HOVER, FillStyle.SolidColor(FortoresseXYTheme_danger, 0.7));

            // Down
            backgroundSkin.setBorderForState(ButtonState.DOWN, LineStyle.SolidColor(4, FortoresseXYTheme_danger, 0.4));
            backgroundSkin.setFillForState(ButtonState.DOWN, FillStyle.SolidColor(FortoresseXYTheme_danger, 0.7));

            // Focus
            button.setFocusPadding(5);
            var focusRectSkin: RectangleSkin = new RectangleSkin();
            focusRectSkin.cornerRadius = 5;
            focusRectSkin.border = LineStyle.SolidColor(4, FortoresseXYTheme_focus);
            button.focusRectSkin = focusRectSkin;
        }

        private function setHeadingLabelStyles(label: Label): void {
            label.textFormat = this.getHeadingTextFormat();
            label.textField.embedFonts = true;
        }

        private function setTextInputStyles(input: TextInput): void {
            // Default
            input.paddingLeft = input.paddingRight = 20, input.paddingTop = input.paddingBottom = 8;
            input.textFormat = this.getTextFormat();
            input.textFormat.color = FortoresseXYTheme_foreground;
            var backgroundSkin: RectangleSkin = new RectangleSkin();
            backgroundSkin.border = LineStyle.SolidColor(4, FortoresseXYTheme_foreground);
            backgroundSkin.fill = FillStyle.SolidColor(0x000000, 0);
            backgroundSkin.cornerRadius = 0;
            input.backgroundSkin = backgroundSkin;

            // Disabled
            backgroundSkin.setBorderForState(TextInputState.DISABLED, LineStyle.SolidColor(4, FortoresseXYTheme_foreground, 0.5));
            input.disabledAlpha = 0.5;
        }
    }
}