import 'package:flutter/material.dart';
import 'package:nosok/bottom_navigation_scaffold.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return BottomNavigationScaffold(
      body: ElevatedButton(
        onPressed: () {},
        child: Text("Nosok"),
      ),
    );
  }
}
