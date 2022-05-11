import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nosok/home.dart';
import 'package:nosok/services/auth.dart';
import 'package:nosok/theme.dart';

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
        Container(
          margin: const EdgeInsets.all(20),
          child: ElevatedButton(
              child: Text('Sign In'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
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
                  },
                );
              }),
        ),
        TextButton(
          onPressed: () => signIn(context),
          child: Text(
            'Sign Up',
            style: TextStyle(color: primaryColor),
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
