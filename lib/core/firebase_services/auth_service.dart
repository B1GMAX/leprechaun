import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<User?> createViaPasswordAndEmail(String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.snackbar('The account already exists for that email.', '',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Something wen wrong!', '',
            snackPosition: SnackPosition.BOTTOM);
      }
    }
    return null;
  }

  Future<User?> loginWithGoogle() async {
   try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser != null) {
        final GoogleSignInAuthentication gAuth = await gUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken,
          idToken: gAuth.idToken,
        );
        final userCredential = await _auth.signInWithCredential(credential);
        return userCredential.user;
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e, s){
     print('loginWithGoogle error - $e; stack - $s');
   }
   return null;
  }
}
