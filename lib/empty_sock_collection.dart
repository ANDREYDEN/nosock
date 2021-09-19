import 'package:flutter/material.dart';

class EmptySockCollection extends StatelessWidget {
  const EmptySockCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey,
            width: 208,
            height: 250,
          ),
          SizedBox(height: 55),
          Text(
            'No socks in your collection yet :(',
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 8),
          Text(
            'Add your socks, to help them find love again!',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
