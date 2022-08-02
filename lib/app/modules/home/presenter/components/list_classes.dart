import 'package:flutter/material.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:ifroom/app/modules/home/presenter/components/class_card.dart';

class ListClasses extends StatelessWidget {
  final List<Class> list;
  const ListClasses({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: ((context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                child: ClassCard(item: list[index]),
              ))),
    );
  }
}
