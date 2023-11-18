import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/shared/AppButton.dart';
import '../../core/RouterGenerator.dart';
import '../../core/Utilis.dart';
import '../../core/constants.dart';
import '../components/item/SocialNetworkItem.dart';
import '../components/shared/background.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //Initially password is obscure
  bool _obscureTextField_1 = true;
  bool _obscureTextField_2 = true;
  bool loading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController(),
      _passwordControllerConfirm = TextEditingController()
  ;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      //backgroundColor: Colors.white,
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Create Account",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: primaryColor, fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 2.5),
                    Text(
                      "Create an account so you can explore "
                          "all the existing jobs",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 4.5),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                            margin:
                            const EdgeInsets.symmetric(horizontal: 10)
                                .copyWith(top: 10)
                                .copyWith(bottom: 10),
                            child: TextFormField(
                              controller: _emailController,
                              cursorColor: Color(0xFF626262),
                              style: textStyleInput,
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
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  CupertinoIcons.at,
                                ),
                                hintText: "Email",
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Container(
                            margin:
                            const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                            child: TextFormField(
                              validator: (String? value) {
                                if (value != null && value.isEmpty) {
                                  return "This field is required";
                                }

                                return null;
                              },
                              cursorColor: Color(0xFF626262),
                              style: textStyleInput,
                              controller: _passwordController,
                              obscureText: _obscureTextField_1,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  CupertinoIcons.lock,
                                ),
                                hintText: "Password",
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureTextField_1 = !_obscureTextField_1;
                                    });
                                  },
                                  child: Icon(
                                    _obscureTextField_1
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Container(
                            margin:
                            const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                            child: TextFormField(
                              validator: (String? value) {
                                if (value != null && value.isEmpty) {
                                  return "This field is required";
                                }
                                if (_passwordControllerConfirm != _passwordController) {
                                  return "Different password";
                                }
                                return null;
                              },
                              cursorColor: Color(0xFF626262),
                              style: textStyleInput,
                              controller: _passwordControllerConfirm,
                              obscureText: _obscureTextField_2,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  CupertinoIcons.lock,
                                ),
                                hintText: "Confirm Password",
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureTextField_2 = !_obscureTextField_2;
                                    });
                                  },
                                  child: Icon(
                                    _obscureTextField_2
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 1.8),
                    AppButton(
                      callback: () {

                        if (formKey.currentState!.validate()) {
                          print(_emailController.text);
                        }
                      },
                      loading: loading,
                      label: "Sign up",
                      buttonType: ButtonType.PRIMARY,
                      width: size.width,
                      horizontalPadding: 10,
                    ),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouterGenerator.loginRoute);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Already have an account",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFF494949),fontWeight: FontWeight.w600,fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE * 5),
                    Container(
                        margin:
                        const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Or continue with",
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color:primaryColor))),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE),
                    SocialNetworkItem(),
                    const SizedBox(height: BUTTON_SEPARATION_SPACE),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}