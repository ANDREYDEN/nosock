import 'package:flutter/material.dart';

import 'package:nosok/theme.dart';

class SimpleScaffold extends StatelessWidget {
  final String title;
  final FloatingActionButton? fab;
  final Widget child;

  SimpleScaffold({
    Key? key,
    required this.title,
    this.fab,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title, style: appBarTextStyle)),
      floatingActionButton: this.fab,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: this.child,
      ),
    );
  }
}
