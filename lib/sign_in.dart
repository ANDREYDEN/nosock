import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nosok/sign_in_popup.dart';
import 'package:nosok/theme.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String route = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Flexible(
          child: OverflowBox(
            child: SvgPicture.asset('assets/SignIn.svg'),
            maxHeight: 1000,
            maxWidth: 1000,
          ),
        ),
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
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return SignInPopup();
                  },
                );
              }),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Sign Up',
            style: TextStyle(color: primaryColor),
          ),
        ),
        SizedBox(height: 48)
      ]),
    );
  }
}
