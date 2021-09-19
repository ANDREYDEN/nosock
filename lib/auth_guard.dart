import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nosok/sign_in.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;

  const AuthGuard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snap) {
            if (snap.hasError) {
              return Text('Error: ${snap.error}');
            }

            if (snap.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            final user = snap.data;

            if (user == null) {
              Future.delayed(Duration(milliseconds: 100)).then((value) {
                Navigator.of(context).pushNamed(SignIn.route);
              });
              return CircularProgressIndicator();
            }

            return child;
          },
        ),
      ),
    );
  }
}
