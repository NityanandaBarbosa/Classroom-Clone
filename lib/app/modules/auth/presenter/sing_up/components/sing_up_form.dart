import 'package:flutter/material.dart';
import 'package:ifroom/app/modules/auth/presenter/sing_up/components/custom_text_field.dart';
import 'package:ifroom/app/modules/auth/presenter/sing_up/stores/sing_up_store.dart';

class SingUpForm extends StatelessWidget {
  final SingUpStore store;
  const SingUpForm({Key? key, required this.store}) : super(key: key);

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
                      textController: store.emailController,
                      isPassword: false),
                  CustomTextField(
                      text: "Password",
                      textController: store.passwordController,
                      isPassword: true),
                  CustomTextField(
                      text: "Full name",
                      textController: store.nameController,
                      isPassword: false),
                  TextButton(
                    onPressed: () async => await store.userSingUp(), 
                    child: const Text(
                      "Register", 
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
