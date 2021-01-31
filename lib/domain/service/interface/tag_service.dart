import 'package:flutter/widgets.dart';
import 'package:todo_regulator/domain/model/tag/tag.dart';

abstract class TagService {
  Future<Tag> create({@required String name, Color color});

  Future<Tag> editTask(Tag tag, String name);

  Future<Tag> changeTagColor(Tag tag, Color newCcolor);

  Future<Tag> deleteTask(Tag tag);
}
