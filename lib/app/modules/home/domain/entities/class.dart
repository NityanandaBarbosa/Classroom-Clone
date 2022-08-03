class Class {
  final int id;
  final String name;
  final String creator;
  final String room;
  final String section;
  final String subject;

  Class({
    required this.id,
    required this.name,
    required this.creator,
    required this.section,
    required this.room,
    required this.subject,
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
