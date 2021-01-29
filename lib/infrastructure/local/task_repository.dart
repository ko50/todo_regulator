import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:todo_regulator/domain/model/task/task.dart';
import 'package:todo_regulator/domain/model/task/task_repository.dart';

class TaskLocalRepository implements TaskRepository {
  static const String prefKey = "tasks_list";

  @override
  Future<void> create(Task entity) async {}

  @override
  Future<void> delete(String id) async {}

  @override
  Future<void> save(Task entity) async {}

  @override
  Future<List<Task>> fetchAll() async {
    final pref = await SharedPreferences.getInstance();
    if (!pref.containsKey(prefKey)) {
      await pref.setString(prefKey, "");
      return [];
    }

    final String value = pref.getString(prefKey);
    if (value.isEmpty) return [];

    final List<Task> valueList = [];
    final List<dynamic> entityList = jsonDecode(value);
    for (dynamic entity in entityList) valueList.add(Task.fromJson(entity));

    return valueList;
  }
}
