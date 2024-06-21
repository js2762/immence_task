import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:immence_task/screens/home_screens/home_view.dart';
import 'package:immence_task/services/api_service.dart';

class AuthenticationProvider with ChangeNotifier {
  String? errorMessage;

  /// sign in
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obSecureTextVal = true;
  bool loginCheckBoxVal = false;

  ///sign up
  final signUpNameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final signUpNumberController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  bool signUpCheckBoxVal = false;

  toggleObSecureVal() {
    obSecureTextVal = !obSecureTextVal;
    notifyListeners();
  }

  toggleLoginCheckBoxVal() {
    loginCheckBoxVal = !loginCheckBoxVal;
    notifyListeners();
  }

  toggleSignUpCheckBoxVal() {
    signUpCheckBoxVal = !signUpCheckBoxVal;
    notifyListeners();
  }

  clearLoginTextControllers() {
    emailController.clear();
    passwordController.clear();
  }

  clearSignUpTextControllers() {
    signUpNameController.clear();
    signUpEmailController.clear();
    signUpNumberController.clear();
    signUpPasswordController.clear();
  }

  Future<void> login() async {
    try {
      bool isLogin = await ApiService().login(email: emailController.text, password: passwordController.text);
      if (isLogin) {
        clearLoginTextControllers();
      }
    } on FirebaseAuthException catch (error) {
      print(error.code);
      if (error.code == 'user-not-found') {
        errorMessage = 'User not found, Please enter valid E-mail';
      } else if (error.code == 'invalid-credential') {
        errorMessage = 'Invalid credential';
      } else if (error.code == 'email-already-in-use') {
        errorMessage = 'User is already exists with this E-mail, try with another E-mail';
      } else {
        errorMessage = 'Could not authenticate you. Please try again later.';
      }
      await Fluttertoast.showToast(msg: errorMessage.toString(), toastLength: Toast.LENGTH_SHORT);
    } catch (error) {
      await Fluttertoast.showToast(msg: error.toString(), toastLength: Toast.LENGTH_SHORT);
    }
  }

  Future<void> signUp(BuildContext context) async {
    try {
      bool isSignUp = await ApiService().signUp(
        name: signUpNameController.text,
        email: signUpEmailController.text,
        number: signUpNumberController.text,
        password: signUpPasswordController.text,
      );
      if (isSignUp) {
        clearSignUpTextControllers();
        
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
          return HomeView();
        },));
      }
      notifyListeners();
    } on FirebaseAuthException catch (error) {
      print(error.code);
      if (error.code == 'email-already-in-use') {
        errorMessage = 'User is already exists with this E-mail, try with another E-mail';
      } else {
        errorMessage = 'Could not authenticate you. Please try again later.';
      }
      await Fluttertoast.showToast(msg: errorMessage.toString(), toastLength: Toast.LENGTH_SHORT);
    } catch (error) {
      await Fluttertoast.showToast(msg: error.toString(), toastLength: Toast.LENGTH_SHORT);
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
