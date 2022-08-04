import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/core/stores/field_is_empty_store.dart';
import 'package:ifroom/app/modules/home/presenter/stores/create_class_store.dart';

import '../../../domain/entities/class.dart';

class ResponsiveCreateButton extends StatelessWidget {
  final CreateClassStore store;
  final FieldIsEmptyStore fieldIsEmptyStore;
  final TextEditingController name;
  final TextEditingController section;
  final TextEditingController room;
  final TextEditingController subject;
  const ResponsiveCreateButton({
    Key? key,
    required this.store,
    required this.fieldIsEmptyStore,
    required this.name,
    required this.section,
    required this.room,
    required this.subject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
        store: store,
        onLoading: (context) => const CreateButtonBlock(),
        onState: (context, state) => CreateButton(
              store: store,
              fieldIsEmptyStore: fieldIsEmptyStore,
              name: name,
              section: section,
              subject: subject,
              room: room,
            ),
        onError: (context, state) => CreateButton(
              store: store,
              fieldIsEmptyStore: fieldIsEmptyStore,
              name: name,
              section: section,
              subject: subject,
              room: room,
            ));
  }
}

class CreateButton extends StatelessWidget {
  final CreateClassStore store;
  final FieldIsEmptyStore fieldIsEmptyStore;
  final TextEditingController name;
  final TextEditingController section;
  final TextEditingController room;
  final TextEditingController subject;
  const CreateButton({
    Key? key,
    required this.store,
    required this.fieldIsEmptyStore,
    required this.name,
    required this.section,
    required this.room,
    required this.subject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: fieldIsEmptyStore.state == true
            ? () async => await store.createClass(
                  CreateClassEntity(
                    name.text,
                    room.text,
                    section.text,
                    subject.text,
                  ),
                )
            : null,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text("Criar", style: TextStyle(fontSize: 16)),
        ));
  }
}

class CreateButtonBlock extends StatelessWidget {
  const CreateButtonBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ElevatedButton(
        onPressed: null,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text("Criar", style: TextStyle(fontSize: 16)),
        ));
  }
}
