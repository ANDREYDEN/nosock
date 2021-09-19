import 'package:flutter/material.dart';
import 'package:nosok/bottom_navigation_scaffold.dart';

class Collection extends StatelessWidget {
  static const String route = '/collection';

  const Collection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationScaffold(
        body: Text('My Collection'), title: 'Collection');
  }
}
