package fortoresseXY.screens {
    import flash.display.*;
    import flash.events.*;
    import feathers.controls.*;
    import feathers.events.*;
    import feathers.layout.*;
    import feathers.text.*;
    import fortoresseXY.images.*;
    import fortoresseXY.app.*;
    import flash.utils.setTimeout;
    import com.eclecticdesignstudio.motion.Actuate;
    import com.eclecticdesignstudio.motion.easing.Linear;
    import com.eclecticdesignstudio.motion.actuators.GenericActuator;
    import flash.utils.clearTimeout;

    public class SignInScreen extends Sprite {
        private static const SPLASH_SCREEN_1: String = "splashScreen1";
        private static const SPLASH_SCREEN_2: String = "splashScreen2";
        private static const SIG_IN_SCREEN: String = "signInScreen";

        private var panel: Panel;
        private var skipButtonGroup: LayoutGroup;
        private var screenId: String = SPLASH_SCREEN_1;
        private var nextScreenTimeout: Object = null;
        private var nextScreenActuatorDisplayList: DisplayObject = null;

        public function SignInScreen() {
            super();

            var btn: Button,
                hl: HorizontalLayout;

            // Panel
            this.panel = new Panel();
            panel.explicitWidth = FortoresseXYApplication.appWidth;
            panel.explicitHeight = FortoresseXYApplication.appHeight;
            const layout: VerticalLayout = new VerticalLayout();
            layout.horizontalAlign = HorizontalAlign.CENTER;
            layout.verticalAlign = VerticalAlign.MIDDLE;
            layout.gap = 10;
            panel.layout = layout;
            this.addChild(panel);

            // Skip button
            this.skipButtonGroup = new LayoutGroup();
            this.skipButtonGroup.explicitWidth = FortoresseXYApplication.appWidth;
            this.skipButtonGroup.explicitHeight = FortoresseXYApplication.appHeight;
            hl = new HorizontalLayout();
            hl.horizontalAlign = HorizontalAlign.RIGHT;
            this.skipButtonGroup.layout = hl;
            this.addChild(this.skipButtonGroup);
            btn = new Button();
            btn.text = "SKIP";
            btn.variant = Button.VARIANT_PRIMARY;
            btn.paddingLeft = btn.paddingRight = 25;
            btn.addEventListener(TriggerEvent.TRIGGER, function(event: TriggerEvent): void {
                nextScreen();
            });
            this.skipButtonGroup.addChild(btn);

            // Splash screen 1
            this.splashScreen1();
        }

        private function nextScreen(): void {
            if (nextScreenTimeout != null) {
                clearTimeout(nextScreenTimeout as uint);
            }
            if (nextScreenActuatorDisplayList != null) {
                Actuate.pause(nextScreenActuatorDisplayList);
                nextScreenActuatorDisplayList = null;
            }
            switch (this.screenId) {
                case SPLASH_SCREEN_1:
                    splashScreen2();
                    break;
                case SPLASH_SCREEN_2:
                    signInScreen();
                    break;
                case SIG_IN_SCREEN:
                    throw new Error("Unreachable");
                    break;
            }
        }

        private function splashScreen1(): void {
            this.screenId = SPLASH_SCREEN_1;
            this.panel.removeChildren();

            var vl: VerticalLayout;

            // Layout group
            var lg: LayoutGroup = new LayoutGroup();
            vl = new VerticalLayout();
            vl.horizontalAlign = HorizontalAlign.CENTER;
            lg.layout = vl;
            this.panel.addChild(lg);

            // Logo
            const logo: Bitmap = new FortoresseXYImages.atelier801Logo() as Bitmap;
            logo.scaleX = logo.scaleY = 0.7;
            lg.addChild(logo);

            // Disclaimer
            const disclaimer: Label = new Label();
            disclaimer.text = "INCLUDES ATELIER 801 PROPERTIES";
            disclaimer.variant = Label.VARIANT_HEADING;
            lg.addChild(disclaimer);

            // Fade in, fade out
            lg.alpha = 0;
            Actuate.tween(nextScreenActuatorDisplayList = lg, 1.5, { alpha: 1 }).ease(Linear.easeNone)
                .onComplete(function(): void {
                    nextScreenTimeout = setTimeout(function(): void {
                        Actuate.tween(nextScreenActuatorDisplayList = lg, 1.5, { alpha: 0 }).ease(Linear.easeNone)
                            .onComplete(function(): void {
                                nextScreen();
                            });
                    }, 2500);
                });
        }

        private function splashScreen2(): void {
            this.screenId = SPLASH_SCREEN_2;
            this.panel.removeChildren();

            // Logo
            const logo: Bitmap = new FortoresseXYImages.hydroperLogo() as Bitmap;
            logo.scaleX = logo.scaleY = 0.37;
            this.panel.addChild(logo);

            // Fade in, fade out
            logo.alpha = 0;
            Actuate.tween(nextScreenActuatorDisplayList = logo, 1.5, { alpha: 1 }).ease(Linear.easeNone)
                .onComplete(function(): void {
                    nextScreenTimeout = setTimeout(function(): void {
                        Actuate.tween(nextScreenActuatorDisplayList = logo, 1.5, { alpha: 0 }).ease(Linear.easeNone)
                            .onComplete(function(): void {
                                nextScreen();
                            });
                    }, 2500);
                });
        }

        private function signInScreen(): void {
            this.screenId = SIG_IN_SCREEN;
            this.panel.removeChildren();

            var hl: HorizontalLayout,
                vl: VerticalLayout,
                btn: Button;

            // Hide "Skip" button
            this.removeChild(this.skipButtonGroup);

            // Group 1
            const group1: LayoutGroup = new LayoutGroup();
            hl = new HorizontalLayout();
            hl.setPadding(25);
            hl.horizontalAlign = HorizontalAlign.CENTER;
            hl.verticalAlign = VerticalAlign.MIDDLE;
            hl.gap = 38;
            group1.layout = hl;
            this.panel.addChild(group1);

            // Logo
            const logo: Bitmap = new FortoresseXYImages.logo() as Bitmap;
            logo.scaleX = logo.scaleY = 0.5;
            group1.addChild(logo);

            // Form
            const form: Form = new Form();
            form.minWidth = 300;
            vl = new VerticalLayout();
            vl.gap = 20;
            form.layout = vl;
            group1.addChild(form);

            // Heading label
            const headingLabel: Label = new Label();
            headingLabel.text = "SIG IN";
            headingLabel.variant = Label.VARIANT_HEADING;
            form.addChild(headingLabel);

            // Username item
            const usernameItem: FormItem = new FormItem();
            usernameItem.text = "USERNAME";
            usernameItem.required = true;
            form.addChild(usernameItem);
            const usernameInput: TextInput = new TextInput();
            usernameInput.maxChars = 40;
            usernameInput.prompt = "USERNAME";
            usernameInput.minWidth = form.minWidth;
            usernameItem.content = usernameInput;

            // Password item
            const passwordItem: FormItem = new FormItem();
            passwordItem.text = "PASSWORD";
            passwordItem.required = true;
            form.addChild(passwordItem);
            const passwordInput: TextInput = new TextInput();
            passwordInput.maxChars = 128;
            passwordInput.prompt = "PASSWORD";
            passwordInput.minWidth = form.minWidth;
            passwordInput.displayAsPassword = true;
            passwordItem.content = passwordInput;

            // Sig in button
            btn = new Button();
            btn.variant = Button.VARIANT_PRIMARY;
            btn.text = "SIG IN";
            btn.minWidth = form.minWidth;
            btn.addEventListener(TriggerEvent.TRIGGER, function(event: TriggerEvent): void {
                form.submit();
            });
            form.addChild(btn);

            // Sign up button
            btn = new Button();
            btn.text = "SIGN UP";
            btn.minWidth = form.minWidth;
            form.addChild(btn);

            // Forgot password button
            btn = new Button();
            btn.text = "FORGOT PASSWORD";
            btn.minWidth = form.minWidth;
            form.addChild(btn);
        }
    }
}