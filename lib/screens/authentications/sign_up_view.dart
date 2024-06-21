import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:immence_task/data/validation.dart';
import 'package:immence_task/screens/authentications/login_view.dart';
import 'package:provider/provider.dart';

import '../../data/app_colors.dart';
import '../../providers/authentication_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../home_screens/home_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
                      "Create an account",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    "Name",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.appCommonColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    child: CustomTextFormField(
                      validator: (value) => Validation.nameValidation(value.toString()),
                      controller: authProviderInstance.signUpNameController,
                      hintText: "Enter your name",
                      fillColor: Colors.transparent,
                      borderColor: AppColors.textFiledBorderColor,
                    ),
                  ),
                  const Text(
                    "Email Address",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.appCommonColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    child: CustomTextFormField(
                      validator: (value) => Validation.emailValidation(value.toString()),
                      controller: authProviderInstance.signUpEmailController,
                      hintText: "Enter your email",
                      fillColor: Colors.transparent,
                      borderColor: AppColors.textFiledBorderColor,
                    ),
                  ),
                  const Text(
                    "Phone Number",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.appCommonColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    child: CustomTextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) => Validation.numberValidation(value.toString()),
                      controller: authProviderInstance.signUpNumberController,
                      hintText: "Enter your phone number",
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
                      controller: authProviderInstance.signUpPasswordController,
                      hintText: "Please Enter Your Password",
                      fillColor: Colors.transparent,
                      borderColor: AppColors.textFiledBorderColor,
                    ),
                  ),
                  Row(
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
                          value: authProviderInstance.signUpCheckBoxVal,
                          onChanged: (value) {
                            authProviderInstance.toggleSignUpCheckBoxVal();
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
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      margin: const EdgeInsets.only(top: 30),
                      bgColor: AppColors.appCommonColor,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      onPressed: () {
                        final isValid = formKey.currentState?.validate();
                        if (isValid != true) {
                          return;
                        } else {
                          authProviderInstance.signUp(context);
                        }
                      },
                      childWidget: const Text(
                        "Sign Up",
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
            const TextSpan(text: "Already have an account ? ", style: TextStyle(color: AppColors.lightGreyColor)),
            TextSpan(
              text: "Login",
              style: const TextStyle(color: AppColors.appCommonColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                authProviderInstance.clearSignUpTextControllers();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return LoginView();
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
