import 'package:flutter/material.dart';
import 'package:nosok/home.dart';
import 'package:nosok/services/auth.dart';
import 'package:nosok/services/firestore.dart';
import 'package:nosok/theme.dart';

class GetToKnowPopup extends StatefulWidget {
  const GetToKnowPopup({Key? key}) : super(key: key);

  @override
  State<GetToKnowPopup> createState() => _GetToKnowPopupState();
}

class _GetToKnowPopupState extends State<GetToKnowPopup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _locationKey = GlobalKey<FormFieldState>();
  final List<String> footSizes = ['4-6', '7-8', '9-11'];
  String? selectedFootSize;

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
        child: Form(
          key: _formKey,
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
              TextFormField(
                key: _locationKey,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid location';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: inputBorder,
                  labelText: 'Location',
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                hint: Text('Foot Size'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please choose a foot size';
                  }
                  return null;
                },
                value: selectedFootSize,
                decoration: InputDecoration(border: inputBorder),
                items: footSizes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedFootSize = newValue!;
                  });
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                child: const Text('Next'),
                onPressed: () {
                  if (_formKey.currentState!.validate())
                    saveUserDetails(context);
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveUserDetails(context) async {
    var location = _locationKey.currentState?.value;

    try {
      await Firestore.saveUserDetails(
          Auth.currentUser?.uid, location, selectedFootSize);
      Navigator.of(context).pushNamed(Home.route);
    } catch (e) {
      print('Something went wrong while saving user details: ' + e.toString());
    }
  }
}
