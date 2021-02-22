import 'package:flutter/material.dart';

class AatmaNirbharFlutterTextField extends StatelessWidget {
  final InputDecoration inputDecoration;
  final TextInputType textInputType;
  final String hintText;
  final TextEditingController editTextController;
  final Key key;

  const AatmaNirbharFlutterTextField({
    this.key,
    this.inputDecoration,
    this.textInputType,
    this.hintText,
    this.editTextController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: editTextController,
      decoration: inputDecoration == null
          ? InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 15.0,
                color: Colors.grey,
              ),
              filled: true,
              fillColor: Colors.white,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white),
              ),
            )
          : inputDecoration,
      keyboardType: textInputType,
    );
  }
}
