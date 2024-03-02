package fortoresseXY.screens {
    import flash.display.*;
    import flash.events.*;
    import feathers.controls.*;
    import feathers.layout.*;
    import feathers.motion.effects.*;
    import feathers.motion.transitions.*;
    import fortoresseXY.images.*;
    import fortoresseXY.app.*;
    import motion.easing.Expo;

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
            const logo: Bitmap = new FortoresseXYImages.logo() as Bitmap;
            logo.alpha = 0;
            logo.scaleX = logo.scaleY = 0.25;
            this.panel.addChild(logo);
            (new FadeTransitionBuilder().setFadeIn(true).setDuration(1.5).setEase(Expo.easeOut).build()(logo, logo) as IEffectContext)
                .addEventListener(Event.COMPLETE, function(event: Event): void {
                    trace("...");
                });
        }
    }
}