import 'package:flutter/material.dart';
import 'package:nosok/empty_sock_collection.dart';
import 'package:nosok/models/sock.dart';
import 'package:nosok/services/auth.dart';
import 'package:nosok/services/firestore.dart';
import 'package:nosok/shared/custom_stream_builder.dart';
import 'package:nosok/shared/simple_scaffold.dart';
import 'package:nosok/sock_form.dart';

import 'listItems/sock_list_item.dart';

class Collection extends StatelessWidget {
  static const String route = '/collection';

  const Collection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleScaffold(
      title: 'My Collection',
      fab: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SockForm()),
          );
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
      child: CustomStreamBuilder<List<Sock>>(
        stream: Firestore.sockStream(Auth.currentUser!.uid),
        builder: (context, List<Sock> socks) {
          if (socks.isEmpty) {
            return EmptySockCollection();
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              childAspectRatio: 0.75,
            ),
            itemCount: socks.length,
            itemBuilder: (context, index) {
              return SockListItem(sock: socks[index]);
            },
          );
        },
      ),
    );
  }
}
