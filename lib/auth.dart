import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  static FirebaseAuth _instance = FirebaseAuth.instance;

  static Future<User?> getCurrentUser() {
    return _instance.authStateChanges().first;
  }

  static Future<UserCredential> signInWithGoogle() {
    return kIsWeb ? _signInWithGoogleForWeb() : _signInWithGoogleNative();
  }

  static Future<UserCredential> _signInWithGoogleNative() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) throw new Exception('Failed to log in with Google');

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future<UserCredential> _signInWithGoogleForWeb() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    return await FirebaseAuth.instance.signInWithPopup(googleProvider);
  }
}
