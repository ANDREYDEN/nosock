import 'package:flutter/material.dart';
import 'package:nosok/home.dart';
import 'package:nosok/services/auth.dart';
import 'package:nosok/theme.dart';
import 'package:nosok/utils/contstants.dart';

enum Method { SignIn, SignUp }

class SignPopup extends StatefulWidget {
  const SignPopup(this.method, {Key? key}) : super(key: key);
  final Method method;

  @override
  State<SignPopup> createState() => _SignPopupState();
}

class _SignPopupState extends State<SignPopup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _fullNameKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _emailKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _passwordKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(13),
            topRight: const Radius.circular(13)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome!',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              SizedBox(height: 5),
              Text("Let's find a perfect pair for you sock :)"),
              SizedBox(height: 30),
              if (this.widget.method == Method.SignUp)
                Column(
                  children: [
                    TextFormField(
                      key: _fullNameKey,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Full Name',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              TextFormField(
                key: _emailKey,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Address',
                ),
                validator: (String? value) {
                  bool emailValid = RegExp(kEmailRegex).hasMatch(value ?? '');
                  if (value == null || value.isEmpty || !emailValid) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                key: _passwordKey,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid password';
                  }
                  if (value.length < 6) {
                    return 'Password should be at least 6 charachters long';
                  }

                  return null;
                },
              ),
              if (this.widget.method == Method.SignIn)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Align(
                    child: Text('Forgot password?'),
                    alignment: Alignment.centerRight,
                  ),
                ),
              Visibility(
                child: ElevatedButton(
                    child: const Text('Sign In'),
                    onPressed: () => {
                          if (_formKey.currentState!.validate()) signIn(context)
                        }),
                replacement: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    child: const Text('Sign Up'),
                    onPressed: () => {
                      if (_formKey.currentState!.validate()) signUp(context)
                    },
                  ),
                ),
                visible: this.widget.method == Method.SignIn,
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
                child: const Text(
                  'Continue With Google',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                onPressed: () => googleSignIn(context),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(this.widget.method == Method.SignIn
                      ? "Don't have an account yet?"
                      : 'Already have an account?'),
                  TextButton(
                    child: Text(
                      ' Sign ${this.widget.method == Method.SignIn ? 'Up' : 'In'}',
                      style: TextStyle(color: primaryColor),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return SignPopup(this.widget.method == Method.SignIn
                              ? Method.SignUp
                              : Method.SignIn);
                        },
                      );
                    },
                  )
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> googleSignIn(context) async {
    try {
      await Auth.signInWithGoogle();
      Navigator.of(context).pushNamed(Home.route);
    } catch (e) {
      print(
          'Something went wrong while signing in with Google: ' + e.toString());
    }
  }

  Future<void> signIn(context) async {
    var email = _emailKey.currentState?.value;
    var password = _passwordKey.currentState?.value;

    try {
      await Auth.signIn(email, password);
      Navigator.of(context).pushNamed(Home.route);
    } catch (e) {
      print('Something went wrong while signing in: ' + e.toString());
    }
  }

  Future<void> signUp(context) async {
    var email = _emailKey.currentState?.value;
    var password = _passwordKey.currentState?.value;
    var fullName = _fullNameKey.currentState?.value;

    try {
      await Auth.signUp(email, password, fullName);
      Navigator.of(context).pushNamed(Home.route);
    } catch (e) {
      print('Something went wrong while signing up: ' + e.toString());
    }
  }
}
