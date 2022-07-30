import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/modules/auth/domain/errors/sing_up_errors.dart';
import 'package:ifroom/app/modules/auth/presenter/sing_up/components/custom_text_field.dart';
import 'package:ifroom/app/modules/auth/presenter/sing_up/components/sing_up_form.dart';
import 'package:ifroom/app/modules/auth/presenter/sing_up/stores/sing_up_store.dart';

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
      if(error is !DoNothing){
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: ScopedBuilder(
        store: widget.store,
        onLoading: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
        onState: ((context, state) => SingUpForm(store: widget.store)),
        onError: ((context, state) => SingUpForm(store: widget.store)),
      ),
    );
  }
}
