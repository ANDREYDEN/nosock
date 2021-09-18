import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static FirebaseAuth _instance = FirebaseAuth.instance;

  static Future<User?> getCurrentUser() {
    return _instance.authStateChanges().first;
  }
}
