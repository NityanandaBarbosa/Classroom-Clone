import 'package:flutter/material.dart';
import 'package:ifroom/app/core/stores/field_is_empty_store.dart';

class ClassCustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController textController;
  final String initalValue;
  final double padding;
  final FieldIsEmptyStore? store;

  const ClassCustomTextField({
    Key? key,
    required this.text,
    required this.textController,
    this.initalValue = "",
    this.padding = 9.0,
    this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            primaryColor: Colors.lightBlueAccent,
            primaryColorDark: Colors.lightBlueAccent),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Container(
            alignment: Alignment.topCenter,
            child: TextField(
              controller: textController,
              onChanged:
                  store != null ? ((value) => store?.isEmpty(value)) : null,
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
