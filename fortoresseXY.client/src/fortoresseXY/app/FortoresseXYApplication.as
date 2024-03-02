package fortoresseXY.app {
    import flash.display.*;
    import flash.events.*;
    import feathers.controls.*;
    import feathers.graphics.*;
    import feathers.skins.*;
    import feathers.style.*;
    import feathers.themes.steel.SteelTheme;
    import agera.core.AgeraApplication;

    public class FortoresseXYApplication extends Application {
        public function FortoresseXYApplication() {
            Theme.setTheme(new SteelTheme());
            super();
            new AgeraApplication();
            this.addEventListener(Event.ADDED_TO_STAGE, this.FortoresseXYApplication_initialize);
        }

        private function FortoresseXYApplication_initialize(event: Event): void {
            this.stage.scaleMode = StageScaleMode.SHOW_ALL;

            // Test
            var panel1: Panel = new Panel();
            trace(stage.width, stage.height);
            // panel1.minWidth = stage.width;
            // panel1.maxHeight = stage.height;
            panel1.explicitWidth = stage.width;
            panel1.explicitHeight = stage.height;
            var skin1: RectangleSkin = new RectangleSkin();
            skin1.fill = SolidColor(0x444444);
            // skin1.width = 800;
            // skin1.height = 600;
            panel1.backgroundSkin = skin1;
            this.addChild(panel1);
        }
    }
}