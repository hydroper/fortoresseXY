package fortoresseXY.screens {
    import flash.display.*;
    import flash.events.*;
    import feathers.controls.*;
    import feathers.events.*;
    import feathers.layout.*;
    import feathers.motion.effects.*;
    import feathers.motion.transitions.*;
    import feathers.text.*;
    import motion.easing.Linear;
    import fortoresseXY.images.*;
    import fortoresseXY.app.*;
    import flash.utils.setTimeout;

    public class SignInScreen extends Sprite {
        private var panel: Panel;

        public function SignInScreen() {
            super();

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

            setTimeout(function(): void {
                splashScreen2();
            }, 2500);

            /*
            logo.alpha = 0;
            (new FadeTransitionBuilder().setFadeIn(true).setDuration(2.5).setEase(Linear.get_easeNone()).build()(logo, logo) as IEffectContext)
                .addEventListener(Event.COMPLETE, function(event: Event): void {
                    trace("...");
                });
            */
        }

        private function splashScreen2(): void {
            this.panel.removeChildren();
            const logo: Bitmap = new FortoresseXYImages.hydroperLogo() as Bitmap;
            logo.scaleX = logo.scaleY = 0.25;
            this.panel.addChild(logo);

            setTimeout(function(): void {
                signInScreen();
            }, 2500);
        }

        private function signInScreen(): void {
            this.panel.removeChildren();

            const group1: LayoutGroup = new LayoutGroup();
            const group1Layout: HorizontalLayout = new HorizontalLayout();
            group1Layout.setPadding(25);
            group1Layout.horizontalAlign = HorizontalAlign.CENTER;
            group1Layout.gap = 38;
            group1.layout = group1Layout;
            this.panel.addChild(group1);

            // Logo
            const logo: Bitmap = new FortoresseXYImages.logo() as Bitmap;
            logo.scaleX = logo.scaleY = 0.48;
            group1.addChild(logo);

            const form: Form = new Form();
            form.minWidth = 300;
            group1.addChild(form);

            const headingLabel: Label = new Label();
            headingLabel.text = "SIG IN";
            headingLabel.variant = Label.VARIANT_HEADING;
            form.addChild(headingLabel);

            const usernameItem: FormItem = new FormItem();
            usernameItem.text = "USERNAME";
            usernameItem.required = true;
            form.addChild(usernameItem);
            const usernameInput: TextInput = new TextInput();
            usernameInput.maxChars = 40;
            usernameInput.prompt = "USERNAME";
            usernameInput.minWidth = form.minWidth;
            usernameItem.content = usernameInput;

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

            const sigInButton: Button = new Button();
            sigInButton.variant = Button.VARIANT_PRIMARY;
            sigInButton.text = "SIG IN";
            sigInButton.addEventListener(TriggerEvent.TRIGGER, function(event: TriggerEvent): void {
                form.submit();
            });
            form.addChild(sigInButton);
        }
    }
}