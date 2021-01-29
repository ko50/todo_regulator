import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:todo_regulator/domain/model/task/task.dart';
import 'package:todo_regulator/domain/model/task/task_repository.dart';

class TaskLocalRepository implements TaskRepository {
  static const String prefKey = "tasks_list";

  @override
  Future<void> create(Task entity) async {
    final pref = await SharedPreferences.getInstance();
    final List<Task> currentTaskList = await fetchAll();

    if (currentTaskList.any((task) => task.id == entity.id)) return;

    final List<Map<String, dynamic>> jsonList =
        [...currentTaskList, entity].map((task) => task.toJson()).toList();

    await pref.setString(prefKey, jsonEncode(jsonList));
  }

  @override
  Future<void> delete(String id) async {
    final pref = await SharedPreferences.getInstance();
    final List<Task> currentTaskList = await fetchAll();

    if (!currentTaskList.any((task) => task.id == id)) return;

    currentTaskList.removeWhere((task) => task.id == id);

    final List<Map<String, dynamic>> jsonList =
        currentTaskList.map((task) => task.toJson()).toList();

    await pref.setString(prefKey, jsonEncode(jsonList));
  }

  @override
  Future<void> update(Task entity) async {
    final pref = await SharedPreferences.getInstance();
    final List<Task> currentTaskList = await fetchAll();

    if (!currentTaskList.any((task) => task.id == entity.id)) return;

    final int index =
        currentTaskList.indexWhere((task) => task.id == entity.id);
    currentTaskList[index] = entity;

    final List<Map<String, dynamic>> jsonList =
        currentTaskList.map((task) => task.toJson()).toList();

    await pref.setString(prefKey, jsonEncode(jsonList));
  }

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
