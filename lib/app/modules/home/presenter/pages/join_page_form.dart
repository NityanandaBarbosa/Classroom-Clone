import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/core/components/custom_text_field.dart';
import 'package:ifroom/app/modules/home/domain/errors/class_errors.dart';
import 'package:ifroom/app/modules/home/presenter/components/responsive_join_button.dart';
import 'package:ifroom/app/modules/home/presenter/components/user_info.dart';
import 'package:ifroom/app/modules/home/presenter/stores/join_class_store.dart';

import '../../../../core/stores/field_is_empty_store.dart';

class JoinPageForm extends StatefulWidget {
  final JoinClassStore store;
  final FieldIsEmptyStore emptyStore;
  const JoinPageForm({Key? key, required this.store, required this.emptyStore})
      : super(key: key);

  @override
  _JoinPageFormState createState() => _JoinPageFormState();
}

class _JoinPageFormState extends State<JoinPageForm> {
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

  TextEditingController code = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Participar da turma",
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
                store: widget.emptyStore,
                onState: (context, state) => ResponsiveJoinButton(
                    store: widget.store,
                    code: code,
                    isEmptyStore: widget.emptyStore),
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Column(
              children: [
                const UserInfo(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                          "Peça para seu professor o código da turma e digite-o aqui."),
                      CustomTextField(
                        text: "Código da turma",
                        isPassword: false,
                        textController: code,
                        padding: 0,
                        store: widget.emptyStore,
                      ),
                      const Text(
                        "Para fazer login com o código da turma",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const Text("• Use uma conta autorizada."),
                      const Text(
                          "• Use um código da turma, com 6-7 letras e números, sem espaços ou símbolos."),
                      Column(
                        children: [
                          const Text(
                            "Se tiver problemas para participar da turma, consulte ",
                          ),
                          Row(
                            children: [
                              const Text("este "),
                              InkWell(
                                  onTap: () => print("artigo"),
                                  child: const Text(
                                    "artigo da Central de Ajuda.",
                                    style: TextStyle(color: Colors.blue),
                                  )),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
