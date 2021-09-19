import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nosok/bottom_navigation_scaffold.dart';
import 'package:nosok/theme.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return BottomNavigationScaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
                elevation: MaterialStateProperty.all(0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Top Picks for you',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Text(
                            'Explore potential matches for your lonely socks',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    new SvgPicture.asset('assets/SockIcon.svg')
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Text('Trading Requests'),
                  ],
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.grey.shade300),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
              ),
            ),
          ],
        ),
      ),
      title: 'Your Socks Collection',
    );
  }
}
