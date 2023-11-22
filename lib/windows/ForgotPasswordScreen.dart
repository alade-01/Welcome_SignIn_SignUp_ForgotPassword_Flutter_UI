import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_login_register_app_ui/components/shared/background.dart';

import '../../components/shared/AppButton.dart';
import '../../core/Utilis.dart';
import '../../core/constants.dart';
import '../core/RouterGenerator.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SizedBox(
      width: size.width,
      height: size.height * .96,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Forgot Password",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: BUTTON_SEPARATION_SPACE * 2.5),
            Text(
              "Enter your email to receive the code to change your password",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: BUTTON_SEPARATION_SPACE * 6),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                     // cursorColor: Color(0xFF626262),
                      controller: emailControler,
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "This field is required";
                        }
                        if (value != null &&
                            value.isNotEmpty &&
                            !StringUtil.isValidEmail(value)) {
                          return "The email is invalid";
                        }
                        return null;
                      },
                      style: textStyleInput,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.at),
                        hintText: "Email",
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: BUTTON_SEPARATION_SPACE * 4),
            AppButton(
              callback: () {
                if (formKey.currentState!.validate()) {}
              },
              label: "Receive my code",
              buttonType: ButtonType.PRIMARY,
              width: size.width,
              horizontalPadding: 10,
            ),
            const SizedBox(height: BUTTON_SEPARATION_SPACE),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouterGenerator.loginRoute);
              },
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  "To come back",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF494949),
                      fontWeight: FontWeight.w600,
                      fontSize: 14
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
