import 'package:firebase_auth/firebase_auth.dart';

class ApiService {

  Future<void> login({required String email,required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      var idTokenResult = await user?.getIdTokenResult();
      //_token = await user?.getIdToken();

      //print(_token);
      // notifyListeners();
      // final prefs = await SharedPreferences.getInstance();
      /*  final userData = json.encode(
          {'token': _token, 'expiryDate': _expiryDate!.toIso8601String()}); */
    } catch (error) {
      // print(error);
      throw error;
    }
  }

  Future<void> signUp({required String name,required String email,required String number, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      var idTokenResult = await user?.getIdTokenResult();
      // _token = await user?.getIdToken();

    } catch (error) {
      throw error;
    }
  }

}
