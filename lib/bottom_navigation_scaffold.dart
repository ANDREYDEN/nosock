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
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(Collection.route);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.style), Text('My Collection')],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(Settings.route);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.perm_identity), Text('Settings')],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
