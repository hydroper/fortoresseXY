package fortoresseXY.screens {
    import flash.display.*;
    import feathers.controls.*;
    import fortoresseXY.app.FortoresseXYApplication;

    public class SignInScreen extends Sprite {
        public function SignInScreen() {
            super();

            // Background panel
            const backgroundPanel: Panel = new Panel();
            backgroundPanel.explicitWidth = FortoresseXYApplication.appWidth;
            backgroundPanel.explicitHeight = FortoresseXYApplication.appHeight;
            this.addChild(backgroundPanel);
        }
    }
}