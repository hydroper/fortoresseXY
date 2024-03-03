package fortoresseXY.screens {
    import flash.display.*;
    import flash.events.*;
    import feathers.controls.*;
    import feathers.layout.*;
    import feathers.motion.effects.*;
    import feathers.motion.transitions.*;
    import feathers.text.*;
    import motion.easing.Linear;
    import fortoresseXY.images.*;
    import fortoresseXY.app.*;

    public class SignInScreen extends Sprite {
        private var panel: Panel;

        public function SignInScreen() {
            super();

            // Panel
            this.panel = new Panel();
            panel.explicitWidth = FortoresseXYApplication.appWidth;
            panel.explicitHeight = FortoresseXYApplication.appHeight;
            const layout: VerticalLayout = new VerticalLayout();
            layout.horizontalAlign = HorizontalAlign1.CENTER;
            layout.verticalAlign = VerticalAlign1.MIDDLE;
            panel.layout = layout;
            this.addChild(panel);

            this.splashScreen1();
        }

        private function splashScreen1(): void {
            this.panel.removeChildren();
            const logo: Bitmap = new FortoresseXYImages.atelier801Logo() as Bitmap;
            logo.scaleX = logo.scaleY = 0.5;
            this.panel.addChild(logo);
            const disclaimer: Label = new Label();
            disclaimer.text = "INCLUDES ATELIER 801 PROPERTIES";
            disclaimer.variant = Label.VARIANT_HEADING;
            this.panel.addChild(disclaimer);
            /*
            (new FadeTransitionBuilder().setFadeIn(true).setDuration(1.5).setEase(Linear.get_easeNone()).build()(logo, logo) as IEffectContext)
                .addEventListener(Event.COMPLETE, function(event: Event): void {
                    trace("...");
                });
            */
        }
    }
}