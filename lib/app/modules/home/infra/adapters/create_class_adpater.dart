import 'package:ifroom/app/modules/home/domain/entities/class.dart';

class CreateClassAdpater {
  Map<String, dynamic> toMap(CreateClassEntity entity) => <String, dynamic>{
        "name": entity.name,
        "section": entity.section,
        "room": entity.room,
        "subject": entity.subject,
      };
}
