package fortoresseXY.app {
    import flash.display.*;
    import flash.events.*;
    import feathers.controls.*;
    import feathers.graphics.*;
    import feathers.skins.*;
    import feathers.style.*;
    import feathers.themes.steel.SteelTheme;
    import agera.core.AgeraApplication;
    import feathers.core.LetterboxScaleManager;

    public class FortoresseXYApplication extends Application {
        public function FortoresseXYApplication() {
            const theme: IDarkModeTheme = new SteelTheme();
            theme.darkMode = true;
            Theme.setTheme(theme);
            super();
            this.scaleManager = new LetterboxScaleManager(800, 600);
            new AgeraApplication();
            this.addEventListener(Event.ADDED_TO_STAGE, this.FortoresseXYApplication_initialize);
        }

        private function FortoresseXYApplication_initialize(event: Event): void {
            // Initialize
        }
    }
}