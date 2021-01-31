import 'package:meta/meta.dart';

import 'package:todo_regulator/domain/model/task/task.dart';
import 'package:todo_regulator/domain/model/task/task_repository.dart';

abstract class ITaskService {
  final TaskRepository repository;

  ITaskService(this.repository);

  Future<Task> create({@required String title, String description});

  Future<Task> editTask(Task task, {String title, String description});

  Future<Task> appendTag(Task task, String tagId);

  Future<Task> removeTag(Task task, String tagId);

  Future<Task> deleteTask(Task task);
}
