import 'package:todo_regulator/domain/model/task/task.dart';

abstract class TaskRepository {
  Future<void> create(Task entity);

  Future<void> delete(String id);

  Future<void> update(Task entity);

  Future<List<Task>> fetchAll();
}
