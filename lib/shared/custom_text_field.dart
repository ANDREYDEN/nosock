import 'package:flutter/material.dart';

import 'package:nosok/theme.dart';

class FieldLines {
  final int min;
  final int max;

  FieldLines({ required this.min, required this.max });
}

class CustomTextField extends StatelessWidget {
  final String label;
  final void Function(String)? onChanged;
  final FieldLines? lines;

  CustomTextField({
    Key? key,
    required this.label,
    this.onChanged,
    this.lines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        minLines: lines != null ? lines!.min : null,
        maxLines: lines != null ? lines!.max : null,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Color(0xFF979797)),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: secondaryText),
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: this.label,
          labelStyle: TextStyle(color: secondaryText),
          hintText: this.label,
          hintStyle: TextStyle(color: Color(0xFF979797)),
        ),
        onChanged: this.onChanged,
      ),
    );
  }
}
