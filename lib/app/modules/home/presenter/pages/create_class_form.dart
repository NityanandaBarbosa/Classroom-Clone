// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:ifroom/app/modules/home/domain/errors/class_errors.dart';
import 'package:ifroom/app/core/components/class_custom_text_field.dart';
import 'package:ifroom/app/modules/home/presenter/components/create_button.dart';
import 'package:ifroom/app/modules/home/presenter/stores/create_class_store.dart';

class CreateClassForm extends StatefulWidget {
  final CreateClassStore store;
  const CreateClassForm({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  _CreateClassFormState createState() => _CreateClassFormState();
}

class _CreateClassFormState extends State<CreateClassForm> {
  final name = TextEditingController();
  final section = TextEditingController();
  final room = TextEditingController();
  final subject = TextEditingController();

  @override
  void dispose() {
    widget.store.fieldIsEmptyStore.destroy();
    widget.store.destroy();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.store.observer(
      onError: ((error) {
        final snackBar = SnackBar(
          content: Text(error.message),
          backgroundColor: Colors.red,
        );

        if (error is! ClassDoNothing) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text("Criar turma",
              style: TextStyle(color: Colors.black87)),
          leading: InkWell(
              child: const Icon(
                Icons.close,
                color: Color.fromARGB(134, 9, 9, 9),
              ),
              onTap: () => Modular.to.pushReplacementNamed('/home/')),
          backgroundColor: Colors.white,
          actions: [
            Row(
              children: [
                ScopedBuilder(
                  store: widget.store.fieldIsEmptyStore,
                  onState: (context, state) => ResponsiveCreateButton(
                      store: widget.store,
                      name: name,
                      section: section,
                      subject: subject,
                      room: room,
                      fieldIsEmptyStore: widget.store.fieldIsEmptyStore),
                ),
                const IconButton(onPressed: null, icon: Icon(Icons.more_vert))
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            ScopedBuilder(
              store: widget.store,
              onLoading: (context) => const LinearProgressIndicator(),
              onError: (context, error) => Container(),
              onState: (context, state) => Container(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 14, 8, 0),
              child: Column(
                children: [
                  ClassCustomTextField(
                    text: "Nome da turma (obrigatório)",
                    textController: name,
                    store: widget.store.fieldIsEmptyStore,
                  ),
                  ClassCustomTextField(
                    text: "Seção",
                    textController: section,
                  ),
                  ClassCustomTextField(
                    text: "Sala",
                    textController: room,
                  ),
                  ClassCustomTextField(
                    text: "Matéria",
                    textController: subject,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
