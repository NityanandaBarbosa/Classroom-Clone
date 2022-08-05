import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/core/stores/field_is_empty_store.dart';
import 'package:ifroom/app/modules/home/presenter/stores/join_class_store.dart';

class ResponsiveJoinButton extends StatelessWidget {
  final JoinClassStore store;
  final FieldIsEmptyStore isEmptyStore;
  final TextEditingController code;
  const ResponsiveJoinButton({
    Key? key,
    required this.store,
    required this.isEmptyStore,
    required this.code,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
        store: store,
        onLoading: (context) => const JoinButtonBlock(),
        onState: (context, state) => JoinButton(
              store: store,
              fieldIsEmptyStore: isEmptyStore,
              code: code,
            ),
        onError: (context, state) => JoinButton(
              store: store,
              fieldIsEmptyStore: isEmptyStore,
              code: code,
            ));
  }
}

class JoinButton extends StatelessWidget {
  final JoinClassStore store;
  final FieldIsEmptyStore fieldIsEmptyStore;
  final TextEditingController code;
  const JoinButton({
    Key? key,
    required this.store,
    required this.fieldIsEmptyStore,
    required this.code,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: fieldIsEmptyStore.state == true
            ? () async => await store.createClass(code.text)
            : null,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: Text("Participar", style: TextStyle(fontSize: 16)),
        ));
  }
}

class JoinButtonBlock extends StatelessWidget {
  const JoinButtonBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ElevatedButton(
        onPressed: null,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: Text("Participar", style: TextStyle(fontSize: 16)),
        ));
  }
}
