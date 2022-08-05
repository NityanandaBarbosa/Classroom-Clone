import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifroom/app/core/components/custom_text_field.dart';
import 'package:ifroom/app/modules/auth/presenter/stores/sing_up_store.dart';

class SingUpForm extends StatelessWidget {
  final SingUpStore store;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  const SingUpForm(
      {Key? key,
      required this.store,
      required this.emailController,
      required this.passwordController,
      required this.nameController})
      : super(key: key);

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
                  CustomTextField(
                      text: "Full name",
                      textController: nameController,
                      isPassword: false),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                          onPressed: () => Modular.to.pushReplacementNamed("/"),
                          child: const Text(
                            "Sing In",
                            style: TextStyle(color: Colors.green),
                          ))
                    ],
                  ),
                  TextButton(
                      onPressed: () async => await store.userSingUp(
                          emailController.text,
                          passwordController.text,
                          nameController.text),
                      child: const Text(
                        "Register",
                        style: TextStyle(fontSize: 20, color: Colors.green),
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
