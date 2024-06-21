import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:immence_task/data/app_colors.dart';
import 'package:immence_task/data/validation.dart';
import 'package:immence_task/providers/authentication_provider.dart';
import 'package:immence_task/screens/authentications/sign_up_view.dart';
import 'package:immence_task/screens/home_screens/home_view.dart';
import 'package:immence_task/widgets/custom_button.dart';
import 'package:immence_task/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final authProviderInstance = Provider.of<AuthenticationProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "immence",
                    style: TextStyle(color: AppColors.appCommonColor, fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      "Hi, Welcome Back! 👋",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.appCommonColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    child: CustomTextFormField(
                      hintText: "Enter your email",
                      validator: (value) => Validation.emailValidation(value.toString()),
                      controller: authProviderInstance.emailController,
                      fillColor: Colors.transparent,
                      borderColor: AppColors.textFiledBorderColor,
                    ),
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.appCommonColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    child: CustomTextFormField(
                      validator: (value) => Validation.passwordValidation(value.toString()),
                      hintText: "Please Enter Your Password",
                      obscureText: authProviderInstance.obSecureTextVal,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            authProviderInstance.toggleObSecureVal();
                          },
                          child: Icon(
                            authProviderInstance.obSecureTextVal ? Icons.visibility_off : Icons.visibility,
                            color: Colors.black,
                          )),
                      controller: authProviderInstance.passwordController,
                      fillColor: Colors.transparent,
                      borderColor: AppColors.textFiledBorderColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            side: WidgetStateBorderSide.resolveWith(
                              (states) => const BorderSide(width: 1.0, color: AppColors.textFiledBorderColor),
                            ),
                            checkColor: Colors.black,
                            activeColor: Colors.transparent,
                            value: authProviderInstance.loginCheckBoxVal,
                            onChanged: (value) {
                              authProviderInstance.toggleLoginCheckBoxVal();
                            },
                          ),
                        ),
                        const Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Remember Me",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      bgColor: AppColors.appCommonColor,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      onPressed: () {
                        final isValid = formKey.currentState?.validate();
                        if (isValid != true) {
                          return;
                        } else {
                          authProviderInstance.login();
                        }
                      },
                      childWidget: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 40,
          alignment: Alignment.center,
          child: RichText(
              text: TextSpan(children: [
            const TextSpan(text: "Don't have an account ? ", style: TextStyle(color: AppColors.lightGreyColor)),
            TextSpan(
              text: "Sign Up",
              style: const TextStyle(color: AppColors.appCommonColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                authProviderInstance.clearLoginTextControllers();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return const SignUpView();
                    },
                  ));
                },
            ),
          ])),
        ),
      ),
    );
  }
}
