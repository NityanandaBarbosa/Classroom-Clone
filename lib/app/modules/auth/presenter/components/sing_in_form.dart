// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ifroom/app/modules/auth/presenter/components/custom_text_field.dart';
import 'package:ifroom/app/modules/auth/presenter/stores/sing_in_store.dart';

class SingInForm extends StatelessWidget {
  final SingInStore store;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const SingInForm({
    Key? key,
    required this.store,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Card(
          elevation: 10,
          color: Colors.white.withOpacity(0.95),
          shadowColor: Colors.grey,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextField(
                      text: "E-mail",
                      textController: emailController,
                      isPassword: false),
                  CustomTextField(
                      text: "Password",
                      textController: passwordController,
                      isPassword: true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("If you haven't a account?"),
                      TextButton(
                          onPressed: () =>
                              Modular.to.pushReplacementNamed("/sing-up"),
                          child: const Text("Sing Up"))
                    ],
                  ),
                  TextButton(
                      onPressed: () async => await store.userSingIn(
                          emailController.text, passwordController.text),
                      child: const Text(
                        "Login",
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
