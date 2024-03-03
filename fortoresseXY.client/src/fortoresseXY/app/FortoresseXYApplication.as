package fortoresseXY.app {
    import flash.display.*;
    import flash.events.*;
    import feathers.core.*;
    import feathers.controls.*;
    import feathers.style.*;
    import agera.core.*;
    import fortoresseXY.themes.*;
    import fortoresseXY.screens.*;

    public class FortoresseXYApplication extends Application {
        public static const appWidth: Number = 1024;
        public static const appHeight: Number = 620;

        public function FortoresseXYApplication() {
            const theme: IDarkModeTheme = new FortoresseXYTheme();
            theme.darkMode = true;
            Theme.setTheme(theme);
            super();
            this.stage.quality = StageQuality.HIGH;
            this.scaleManager = new LetterboxScaleManager(appWidth, appHeight);
            new AgeraApplication();
            this.addEventListener(Event.ADDED_TO_STAGE, this.FortoresseXYApplication_initialize);
        }

        private function FortoresseXYApplication_initialize(event: Event): void {
            // Initialize
            this.addChild(new SignInScreen());
        }
    }
}