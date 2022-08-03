import 'package:flutter/material.dart';

class ClassCustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController textController;
  final String initalValue;

  const ClassCustomTextField({
    Key? key,
    required this.text,
    required this.textController,
    this.initalValue = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            primaryColor: Colors.lightBlueAccent,
            primaryColorDark: Colors.lightBlueAccent),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            alignment: Alignment.topCenter,
            child: TextField(
              controller: textController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                labelText: text,
              ),
            ),
          ),
        ));
  }
}
