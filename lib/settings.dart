import 'package:flutter/cupertino.dart';
import 'package:nosok/bottom_navigation_scaffold.dart';
import 'package:nosok/services/auth.dart';
import 'package:nosok/services/firestore.dart';

class Settings extends StatelessWidget {
  static const String route = '/settings';

  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Auth.currentUser;
    final details = Firestore.getUserDetails(user?.uid);

    return BottomNavigationScaffold(
      title: 'Settings',
      body: Center(
        child: Column(
          children: [
            Text('Full name: ${user?.displayName ?? ''}'),
            Text('Email: ${user?.email ?? ''}'),
            Text('Location: ${details}'),
          ],
        ),
      ),
    );
  }
}
