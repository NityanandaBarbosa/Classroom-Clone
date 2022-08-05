import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/modules/auth/domain/errors/sing_in_errors.dart';
import 'package:ifroom/app/modules/auth/presenter/components/sing_in_form.dart';
import 'package:ifroom/app/modules/auth/presenter/stores/sing_in_store.dart';

class SingInPage extends StatefulWidget {
  final SingInStore store;
  const SingInPage({Key? key, required this.store}) : super(key: key);

  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.store.observer(
      onError: ((error) {
        final snackBar = SnackBar(
          content: Text(error.message),
          backgroundColor: Colors.red,
        );

        if (error is! DoNothing) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.white30, Colors.grey]),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text("Login",
                      style: TextStyle(
                          fontSize: 60,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87,
                          shadows: [
                            Shadow(
                                color: Colors.white54,
                                offset: Offset(1, 3),
                                blurRadius: 20)
                          ])),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Classroom",
                      style: TextStyle(
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87,
                          shadows: [
                            Shadow(
                                color: Colors.white54,
                                offset: Offset(1, 3),
                                blurRadius: 20)
                          ])),
                ),
                ScopedBuilder(
                  store: widget.store,
                  onLoading: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  onState: ((context, state) => SingInForm(
                        store: widget.store,
                        emailController: emailController,
                        passwordController: passwordController,
                      )),
                  onError: ((context, state) => SingInForm(
                        store: widget.store,
                        emailController: emailController,
                        passwordController: passwordController,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
