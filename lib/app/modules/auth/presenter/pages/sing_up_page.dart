import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/modules/auth/domain/errors/sing_up_errors.dart';
import 'package:ifroom/app/modules/auth/presenter/components/sing_up_form.dart';
import 'package:ifroom/app/modules/auth/presenter/stores/sing_up_store.dart';

class SingUpPage extends StatefulWidget {
  final SingUpStore store;
  const SingUpPage({Key? key, required this.store}) : super(key: key);

  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
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
              colors: [Colors.yellow, Colors.green]),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text("Register",
                      style: TextStyle(
                          fontSize: 60,
                          fontStyle: FontStyle.italic,
                          color: Colors.lightGreen,
                          shadows: [
                            Shadow(
                                color: Colors.black87,
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
                          color: Colors.lightGreen,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                offset: Offset(1, 3),
                                blurRadius: 20)
                          ])),
                ),
                ScopedBuilder(
                  store: widget.store,
                  onLoading: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  onState: ((context, state) =>
                      SingUpForm(store: widget.store)),
                  onError: ((context, state) =>
                      SingUpForm(store: widget.store)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
