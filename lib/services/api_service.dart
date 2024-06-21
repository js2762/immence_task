import 'package:firebase_auth/firebase_auth.dart';

class ApiService {
  Future<bool> login({required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      var idTokenResult = await user?.getIdTokenResult();
      print(99999999);
      print(idTokenResult);
      if (idTokenResult != null) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      throw error;
    }
  }

  Future<bool> signUp({required String name, required String email, required String number, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      var idTokenResult = await user?.getIdTokenResult();
      print(idTokenResult);
      print(272727);
      if (idTokenResult != null) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      throw error;
    }
  }
}
