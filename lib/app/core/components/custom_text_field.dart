import 'package:flutter/material.dart';
import 'package:ifroom/app/core/styles/components_styles.dart';

import '../stores/field_is_empty_store.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final bool isPassword;
  final TextEditingController textController;
  final bool hasButton;
  final bool isPasswordHide;
  final double padding;
  final FieldIsEmptyStore? store;

  const CustomTextField({
    Key? key,
    required this.text,
    required this.isPassword,
    required this.textController,
    this.isPasswordHide = false,
    this.hasButton = false,
    this.padding = 5.0,
    this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            primaryColor: Colors.black54, primaryColorDark: Colors.black54),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Container(
            alignment: Alignment.topCenter,
            child: TextField(
              obscureText: isPasswordHide,
              controller: textController,
              keyboardType: TextInputType.emailAddress,
              onChanged:
                  store != null ? ((value) => store?.isEmpty(value)) : null,
              decoration: InputDecoration(
                hintText: text,
                labelText: text,
                labelStyle: ComponentsStyles.regurlar13Black,
                border: ComponentsStyles.inputBorderBlack54,
                suffixIcon: !hasButton
                    ? null
                    : !isPassword
                        ? const IconButton(
                            icon: Icon(Icons.account_circle),
                            onPressed: null,
                          )
                        : IconButton(
                            icon: Icon(!isPasswordHide
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () => null,
                          ),
                // onChanged: store.setEmail,
              ),
            ),
          ),
        ));
  }
}
