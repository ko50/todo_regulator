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

  Task.fromJson(Map<String, dynamic> json)
      : this.id = json["id"],
        this.deadline = json["deadline"],
        this.title = json["title"],
        this.description = json["description"],
        this.tags = json["tags"],
        this.priority = json["priority"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "deadline": deadline,
        "title": title,
        "description": description,
        "tags": tags,
        "priority": priority,
      };
}
