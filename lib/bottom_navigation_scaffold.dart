import 'package:flutter/material.dart';
import 'package:nosok/collection.dart';
import 'package:nosok/settings.dart';
import 'package:nosok/theme.dart';

class BottomNavigationScaffold extends StatelessWidget {
  final Widget body;

  const BottomNavigationScaffold({Key? key, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nosok',
          style: appBarTextStyle,
        ),
      ),
      body: body,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: secondaryColor,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.swap_horiz,
              color: Colors.white,
              size: 25,
            ),
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              bottomAppBarAction(
                context,
                icon: Icons.sports_hockey_sharp,
                label: 'My Collection',
                onTap: () {
                  Navigator.of(context).pushNamed(Collection.route);
                },
              ),
              bottomAppBarAction(
                context,
                icon: Icons.perm_identity,
                label: 'Settings',
                onTap: () {
                  Navigator.of(context).pushNamed(Settings.route);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomAppBarAction(
    context, {
    required IconData icon,
    required String label,
    required void Function() onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(height: 8),
            Text(label, style: TextStyle(color: Colors.white)),
          ],
        ),
      );
}
