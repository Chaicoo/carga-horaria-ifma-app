import 'package:flutter/material.dart';

class InputTextArea extends StatelessWidget {
  final String placeholder;

  InputTextArea({required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: TextField(
        maxLines: null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          hintText: placeholder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
