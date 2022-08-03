class Class {
  final int id;
  final String name;
  final String creator;
  final String section;

  Class({
    required this.id,
    required this.name,
    required this.creator,
    required this.section,
  });
}

class CreateClassEntity {
  final String name;
  final String room;
  final String section;
  final String subject;

  CreateClassEntity(
    this.name, [
    this.room = "",
    this.section = "",
    this.subject = "",
  ]);
}
