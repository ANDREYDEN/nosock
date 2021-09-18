import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nosok/auth.dart';
import 'package:nosok/home.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String route = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nosok')),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () => signIn(context),
            child: Text('Sign In With Google'),
          ),
        ),
      ),
    );
  }

  Future<void> signIn(context) async {
    try {
      await Auth.signInWithGoogle();
      Navigator.of(context).pushNamed(Home.route);
    } catch (e) {
      print('Something went wrong while logging in with google');
    }
  }
}
