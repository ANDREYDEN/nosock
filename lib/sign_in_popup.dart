import 'package:flutter/material.dart';
import 'package:nosok/home.dart';
import 'package:nosok/services/auth.dart';
import 'package:nosok/theme.dart';

class SignInPopup extends StatelessWidget {
  const SignInPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome!',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Text("Let's find a perfect pair for you sock :)"),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email Address',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              child: const Text('Sign In'),
              onPressed: () => Navigator.pop(context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: <Widget>[
                  Expanded(child: Divider(height: 2)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(height: 2)),
                ],
              ),
            ),
            ElevatedButton(
              child: const Text('Continue with Google'),
              onPressed: () => signIn(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account yet?"),
                Text(
                  ' Sign Up',
                  style: TextStyle(color: primaryColor),
                )
              ],
            )
          ],
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
