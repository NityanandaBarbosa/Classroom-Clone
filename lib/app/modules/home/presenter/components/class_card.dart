import 'package:flutter/material.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';

class ClassCard extends StatelessWidget {
  final Class item;
  const ClassCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        color: const Color.fromARGB(255, 4, 104, 185).withOpacity(0.8),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(item.name,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withOpacity(0.9))),
                      ),
                      InkWell(
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        onTap: (() => print("Click")),
                      ),
                    ],
                  ),
                  Text(item.section,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.9)))
                ],
              ),
              Flexible(
                child: Text(item.creator,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.85))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
