import 'package:flutter/material.dart';
import 'package:ifroom/app/core/styles/components_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool isPassword;
  final TextEditingController textController;
  final bool isPasswordHide;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.isPassword,
    required this.textController,
    this.isPasswordHide = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Theme(
        data: ThemeData(
            primaryColor: Colors.black54, primaryColorDark: Colors.black54),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            alignment: Alignment.topCenter,
            child: TextField(
              obscureText: isPasswordHide,
              controller: textController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: hintText,
                labelText: labelText,
                labelStyle: ComponentsStyles.regurlar13Black,
                border: ComponentsStyles.inputBorderBlack54,
                suffixIcon: !isPassword
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
