import 'package:flutter/material.dart';
import 'package:nosok/theme.dart';

class GetToKnowPopup extends StatefulWidget {
  const GetToKnowPopup({Key? key}) : super(key: key);

  @override
  State<GetToKnowPopup> createState() => _GetToKnowPopupState();
}

class _GetToKnowPopupState extends State<GetToKnowPopup> {
  final List<String> sockSizes = ['4-6', '7-8', '9-11'];
  String? selectedSockSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(13),
            topRight: const Radius.circular(13)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Let us get to know you better',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            SizedBox(height: 5),
            Text(
                'We need this information to make you find a perfect sock-match quicker :)'),
            SizedBox(height: 30),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: inputBorder,
                labelText: 'Location',
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              hint: Text('Foot Size'),
              value: selectedSockSize,
              decoration: InputDecoration(border: inputBorder),
              items: sockSizes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedSockSize = newValue!;
                });
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              child: const Text('Next'),
              onPressed: () {},
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
