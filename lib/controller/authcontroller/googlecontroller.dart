import 'package:calculator/model/usermodel.dart';
import 'package:calculator/view/profilepage.dart';
import 'package:calculator/view/signinpage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GoogleController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();
      if (googleAccount != null) {
        final GoogleSignInAuthentication googleAuth = await googleAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential = await _auth.signInWithCredential(authCredential);
        final User? user = userCredential.user;
        print(user!.email);

        if (user != null) {
          UserModel userModel = UserModel(
            uId: user.uid,
            username: user.displayName ?? '',
            email: user.email ?? '',
            phone: user.phoneNumber ?? '',
            userImg: user.photoURL ?? '',
          );

        }
      }
    } catch (e) {
      print('Error signing in: $e');
      // Display error message to the user
    }
  }

  Future<void> googleSignOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      Get.offAll(() => const SignIn());
    } catch (e) {
      print('Error signing out: $e');
      // Display error message to the user
    }
  }
}
