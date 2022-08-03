import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:ifroom/app/modules/home/presenter/components/list_classes.dart';

import '../stores/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  final HomeStore store;
  const HomePage({
    Key? key,
    this.title = "IFCE Sala de Aula",
    required this.store,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.store.apiGetClasses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title:
            Text(widget.title, style: const TextStyle(color: Colors.black87)),
        leading: const IconButton(icon: Icon(Icons.menu), onPressed: null),
        backgroundColor: Colors.white,
      ),
      body: ScopedBuilder(
        store: widget.store,
        onLoading: (context) => const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        ),
        onState: (_, List<Class> state) {
          return ListClasses(list: state);
        },
        onError: (context, error) {
          print(error.runtimeType);
          return const Center(
              child: Text(
            'Too many clicks',
            style: TextStyle(color: Colors.red),
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              builder: (context) => SizedBox(
                    height: 150,
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () =>
                              Modular.to.pushReplacementNamed('/home/class'),
                          title: const Text(
                            "Criar turma",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        ListTile(
                          onTap: () => print("Entrar na turma"),
                          title: const Text(
                            "Participar da turma",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ));
        },
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 5, 101, 180),
        ),
      ),
    );
  }
}
