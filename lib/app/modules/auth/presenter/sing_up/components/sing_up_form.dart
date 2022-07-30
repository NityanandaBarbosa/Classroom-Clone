import 'package:flutter/material.dart';
import 'package:ifroom/app/modules/auth/presenter/sing_up/components/custom_text_field.dart';
import 'package:ifroom/app/modules/auth/presenter/sing_up/stores/sing_up_store.dart';

class SingUpForm extends StatelessWidget {
  final SingUpStore store;
  const SingUpForm({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Card( 
          elevation: 5,
          color: Colors.white.withOpacity(0.9),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                      hintText: "Your E-mail",
                      labelText: "E-mail",
                      textController: store.emailController,
                      isPassword: false),
                  CustomTextField(
                      hintText: "Your password",
                      labelText: "Password",
                      textController: store.passwordController,
                      isPassword: true),
                  CustomTextField(
                      hintText: "Your full name",
                      labelText: "Full name",
                      textController: store.nameController,
                      isPassword: false),
                  TextButton(
                    onPressed: () async => await store.userSingUp(), 
                    child: const Text(
                      "Submit", 
                      style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
