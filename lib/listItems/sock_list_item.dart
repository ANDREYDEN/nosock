import 'package:flutter/material.dart';
import 'package:nosok/models/sock.dart';

class SockListItem extends StatelessWidget {
  final Sock sock;

  const SockListItem({Key? key, required this.sock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 165,
          height: 165,
          child: sock.preview != null
              ? Image.network(sock.preview!)
              : Container(color: Colors.grey),
        ),
        Text(sock.name, style: Theme.of(context).textTheme.subtitle2),
        SizedBox(height: 5),
        if (sock.description != null)
          Text(sock.description!, style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}
