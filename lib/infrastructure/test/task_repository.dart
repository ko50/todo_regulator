import 'package:todo_regulator/domain/model/task/task.dart';
import 'package:todo_regulator/domain/model/task/task_repository.dart';

class TestTaskRepository implements TaskRepository {
  static final List<Task> _mock = [
    Task(),
  ];

  @override
  Future<void> create(Task entity) async =>
      Future.delayed(Duration(seconds: 3));

  @override
  Future<void> delete(String id) async => Future.delayed(Duration(seconds: 3));

  @override
  Future<void> update(Task entity) async =>
      Future.delayed(Duration(seconds: 3));

  @override
  Future<List<Task>> fetchAll() async => Future.delayed(
        Duration(seconds: 3),
        () => _mock,
      );
}
