import 'package:firebase_auth/firebase_auth.dart';

class ApiService {
  Future<bool> login({required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      var idTokenResult = await user?.getIdTokenResult();
      if (idTokenResult != null) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      // print(error);
      throw error;
    }
  }

  Future<bool> signUp({required String name, required String email, required String number, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      var idTokenResult = await user?.getIdTokenResult();
      // _token = await user?.getIdToken();
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
