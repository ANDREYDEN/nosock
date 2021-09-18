import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  Future<UserCredential> signInForNative() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInForWeb() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    return await FirebaseAuth.instance.signInWithPopup(googleProvider);
  }

  Future<UserCredential> signIn() async {
    return kIsWeb ? signInForWeb() : signInForNative();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: signIn,
        child: Text('Sign In With Google'),
      ),
    );
  }
}
