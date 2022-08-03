import 'package:ifroom/app/modules/home/domain/entities/class.dart';

class ClassAdapter {
  static Class fromMap(Map<String, dynamic> map) {
    return Class(
      id: map["id"],
      name: map["name"] ?? "",
      creator: map["ownerName"] ?? "",
      section: map["section"] ?? "",
    );
  }
}
