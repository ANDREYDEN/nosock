import 'package:flutter/material.dart';
import 'package:nosok/models/sock.dart';
import 'package:nosok/services/auth.dart';
import 'package:nosok/services/firestore.dart';
import 'package:nosok/shared/custom_stream_builder.dart';
import 'package:nosok/theme.dart';

class Collection extends StatelessWidget {
  static const String route = '/collection';

  const Collection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Collection',
          style: appBarTextStyle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: CustomStreamBuilder<List<Sock>>(
        stream: Firestore.sockStream(Auth.currentUser!.uid),
        builder: (context, List<Sock> socks) {
          if (socks.isEmpty) {
            return Text('No socks');
          }
          return ListView.builder(
            itemCount: socks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(socks[index].name),
              );
            },
          );
        },
      ),
    );
  }
}
