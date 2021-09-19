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
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
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
                        children: [
                          Text('Top Picks for you',
                              style: Theme.of(context).textTheme.headline3),
                          SizedBox(height: 10),
                          Text(
                            'Explore potential matches for your lonely socks',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset('assets/TopPick.svg')
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            tradeActionButton(label: 'Trading Requests', onClick: () {}),
            SizedBox(height: 16),
            tradeActionButton(label: 'Trades', onClick: () {}),
            SizedBox(height: 40),
          ],
        ),
      ),
      title: 'Your Socks Collection',
    );
  }

  Widget tradeActionButton({
    required String label,
    required void Function() onClick,
  }) =>
      TextButton(
        onPressed: onClick,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade300),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label),
              SvgPicture.asset('assets/Arrow.svg'),
            ],
          ),
        ),
      );
}
