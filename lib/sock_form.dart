import 'package:flutter/material.dart';
import 'package:nosok/services/auth.dart';
import 'package:nosok/services/firestore.dart';
import 'package:nosok/shared/custom_text_field.dart';
import 'package:nosok/shared/simple_scaffold.dart';
import 'package:nosok/theme.dart';

import 'models/sock.dart';

class SockForm extends StatefulWidget {
  const SockForm({Key? key}) : super(key: key);

  @override
  _SockFormState createState() => _SockFormState();
}

class _SockFormState extends State<SockForm> {
  Sock _sock = Sock.empty(owner: Auth.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    return SimpleScaffold(
      title: 'Add Your Sock',
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      if (_sock.photoUrls.isEmpty)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _sock.photoUrls.add(
                                'https://www.seekpng.com/png/full/236-2361655_25-sock.png',
                              );
                            });
                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              border: Border.all(color: tertiaryText),
                            ),
                            child:
                                Icon(Icons.camera_enhance, color: tertiaryText),
                          ),
                        ),
                      if (_sock.photoUrls.isNotEmpty)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _sock.photoUrls.removeLast();
                            });
                          },
                          child: Image.network(_sock.preview!, width: 80),
                        )
                    ],
                  ),
                ),
                CustomTextField(
                  label: 'Sock Name',
                  onChanged: (value) {
                    setState(() {
                      _sock.name = value;
                    });
                  },
                ),
                CustomTextField(
                  label: 'Description',
                  lines: FieldLines(min: 2, max: 3),
                  onChanged: (value) {
                    setState(() {
                      _sock.description = value;
                    });
                  },
                ),
                CustomTextField(
                  label: 'Size',
                  onChanged: (value) {
                    setState(() {
                      _sock.size = int.tryParse(value) ?? 43;
                    });
                  },
                ),
                CustomTextField(
                  label: 'Location Lost',
                  onChanged: (value) {
                    setState(() {
                      _sock.locationLost = value;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: ElevatedButton(
                onPressed: () async {
                  await Firestore.addSock(_sock);
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
