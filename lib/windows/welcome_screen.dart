import 'package:flutter/material.dart';
import 'package:welcome_signIn_signUp_forgotPassword/components/shared/background.dart';

import '../components/item/welcome_item.dart';
import '../components/shared/app_button.dart';
import '../core/router_generator.dart';
import '../core/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: <Widget>[
            const Expanded(
              flex: 8,
              child: WelcomeItem(
                title: "Discover Your \n Dream Job Here",
                image: "res/images/imageHoneApp.svg",
                text:
                    "Explore all the existing job roles based on your \n interest and study major",
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: defaultPadding * 4.5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AppButton(
                              callback: () => Navigator.pushNamed(
                                  context, RouterGenerator.loginRoute),
                              label: "Login",
                              buttonType: ButtonType.PRIMARY,
                              horizontalPadding: 12.0),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouterGenerator.registerRoute);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                "Register",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
