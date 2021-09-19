import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nosok/bottom_navigation_scaffold.dart';
import 'package:nosok/collection.dart';
import 'package:nosok/listItems/sock_list_item.dart';
import 'package:nosok/models/sock.dart';
import 'package:nosok/services/auth.dart';
import 'package:nosok/services/firestore.dart';
import 'package:nosok/shared/custom_stream_builder.dart';
import 'package:nosok/theme.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return BottomNavigationScaffold(
      title: 'Your Socks Collection',
      body: ListView(
        padding: EdgeInsets.all(19.0),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My Collection',
                  style: Theme.of(context).textTheme.headline3),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Collection.route);
                },
                child: Text('See All',
                    style: Theme.of(context).textTheme.headline6),
              ),
            ],
          ),
          SizedBox(height: 16),
          CustomStreamBuilder(
            stream: Firestore.sockStream(Auth.currentUser!.uid),
            builder: (context, List<Sock> socks) {
              if (socks.isEmpty) {
                return Text('No Socks yet :(');
              }
              return SizedBox(
                height: 250,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: socks.length,
                  itemBuilder: (context, index) {
                    return SockListItem(sock: socks[index]);
                  },
                ),
              );
            },
          )
        ],
      ),
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
