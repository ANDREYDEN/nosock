import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nosok/collection.dart';
import 'package:nosok/settings.dart';
import 'package:nosok/theme.dart';

class BottomNavigationScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  const BottomNavigationScaffold(
      {Key? key, required this.body, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
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
          child: Padding(
            padding: const EdgeInsets.only(left: 35, right: 46),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bottomAppBarAction(
                  context,
                  icon: SvgPicture.asset('assets/SockIcon.svg'),
                  label: 'My Collection',
                  onTap: () {
                    Navigator.of(context).pushNamed(Collection.route);
                  },
                ),
                bottomAppBarAction(
                  context,
                  icon: Icon(Icons.perm_identity, color: Colors.white),
                  label: 'Settings',
                  onTap: () {
                    Navigator.of(context).pushNamed(Settings.route);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomAppBarAction(
    context, {
    required Widget icon,
    required String label,
    required void Function() onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            SizedBox(height: 8),
            Text(label, style: TextStyle(color: Colors.white)),
          ],
        ),
      );
}
