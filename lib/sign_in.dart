import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nosok/home.dart';
import 'package:nosok/services/auth.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String route = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SvgPicture.asset('assets/SignIn.svg'),
        Text(
          'Welcome to',
          style: TextStyle(fontSize: 16),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 20.0),
          child: Text(
            'Nosock',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () => signIn(context),
            child: Text('Sign In With Google'),
          ),
        ),
      ]),
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
