import 'package:time_keeper/constants.dart';
import 'package:time_keeper/components/rounded_button.dart';
import 'package:time_keeper/screens/login_screen.dart';
import 'package:time_keeper/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    animation = ColorTween(
      begin: Colors.blueGrey,
      end: kBackgroundColor,
    ).animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset(kLogo),
                  ),
                ),
                // TypewriterAnimatedText(text: ['test']),
                // AnimatedTextKit(animatedTexts: [] ),

                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      kAppName,
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: kBrightTextColor,
                      ),
                      // textStyle: const TextStyle(
                      //   fontSize: 32.0,
                      //   fontWeight: FontWeight.bold,
                      // ),
                      speed: const Duration(milliseconds: 1000),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 500),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Hero(
              tag: 'log_in_button',
              child: RoundedButton(
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    LoginScreen.id,
                  );
                },
                label: 'Log In',
                color: kLogInButtonColor,
              ),
            ),
            Hero(
              tag: 'register_button',
              child: RoundedButton(
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    RegistrationScreen.id,
                  );
                },
                label: 'Register',
                color: kRegisterButtonColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
