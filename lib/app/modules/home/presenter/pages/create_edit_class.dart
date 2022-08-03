import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:ifroom/app/modules/home/presenter/pages/components/class_custom_text_field.dart';
import 'package:ifroom/app/modules/home/presenter/stores/create_class_store.dart';

import '../../domain/usecases/create_class.dart';

class CreateEditClass extends StatefulWidget {
  final CreateClassStore store;
  const CreateEditClass({Key? key, required this.store});

  @override
  _CreateEditClassState createState() => _CreateEditClassState();
}

class _CreateEditClassState extends State<CreateEditClass> {
  final name = TextEditingController();
  final section = TextEditingController();
  final room = TextEditingController();
  final subject = TextEditingController();
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
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 33, 119, 211)),
                    ),
                    onPressed: () async => await widget.store.createClass(
                        CreateClassEntity(
                            name.text, room.text, section.text, subject.text)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("Criar",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                    )),
                const IconButton(onPressed: null, icon: Icon(Icons.more_vert))
              ],
            ),
          ],
        ),
        body: ScopedBuilder(
          store: widget.store,
          onError: (context, error) => const Center(
            child: Text("ERROR"),
          ),
          onLoading: ((context) =>
              const Center(child: CircularProgressIndicator())),
          onState: ((context, state) => Padding(
                padding: const EdgeInsets.fromLTRB(8, 14, 8, 0),
                child: Column(
                  children: [
                    ClassCustomTextField(
                      text: "Nome da turma (obrigatório)",
                      textController: name,
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
              )),
        ));
  }
}
