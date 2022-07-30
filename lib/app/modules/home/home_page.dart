import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  final HomeStore store;
  const HomePage({
    Key? key,
    this.title = "Home",
    required this.store,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: ScopedBuilder<HomeStore, Exception, int>(
        store: widget.store,
        onState: (_, counter) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Text('$counter'),
          );
        },
        onError: (context, error) => const Center(
          child: Text(
            'Too many clicks',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.store.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
