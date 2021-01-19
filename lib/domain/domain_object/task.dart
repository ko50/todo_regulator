import 'package:todo_regulator/domain/domain_object/enum/priority.dart';
import 'package:todo_regulator/domain/domain_object/tag.dart';

class Task {
  final String id;
  DateTime deadline;
  String title;
  String description;
  List<Tag> tags;
  Priority priority;

  Task({
    this.id,
    this.deadline,
    this.title,
    this.description,
    this.tags,
    this.priority,
  });
}
