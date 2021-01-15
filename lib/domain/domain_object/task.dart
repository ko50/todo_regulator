import 'package:todo_regulator/domain/domain_object/tag.dart';

class Task {
  final String id;
  String title;
  String description;
  List<Tag> tags;

  Task({
    this.id,
    this.title,
    this.description,
    this.tags,
  });
}
