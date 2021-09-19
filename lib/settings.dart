import 'package:flutter/cupertino.dart';
import 'package:nosok/bottom_navigation_scaffold.dart';

class Settings extends StatelessWidget {
  static const String route = '/settings';

  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationScaffold(
      body: Text('Settings'),
      title: 'Settings',
    );
  }
}
