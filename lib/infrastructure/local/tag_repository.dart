import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_regulator/domain/model/tag/tag_repository.dart';

import 'package:todo_regulator/domain/model/tag/tag.dart';
import 'package:todo_regulator/domain/model/tag/tag_repository.dart';

class TagLocalRepository implements TagRepository {
  static const String prefKey = "tags_list";

  @override
  Future<void> create(Tag entity) async {
    final pref = await SharedPreferences.getInstance();
    final List<Tag> currentTagList = await fetchAll();

    if (currentTagList.any((tag) => tag.id == entity.id)) return;

    final List<Map<String, dynamic>> jsonList =
        [...currentTagList, entity].map((tag) => tag.toJson()).toList();

    await pref.setString(prefKey, jsonEncode(jsonList));
  }

  @override
  Future<void> delete(String id) async {
    final pref = await SharedPreferences.getInstance();
    final List<Tag> currentTagList = await fetchAll();

    if (!currentTagList.any((tag) => tag.id == id)) return;

    currentTagList.removeWhere((tag) => tag.id == id);

    final List<Map<String, dynamic>> jsonList =
        currentTagList.map((tag) => tag.toJson()).toList();

    await pref.setString(prefKey, jsonEncode(jsonList));
  }

  @override
  Future<void> update(Tag entity) async {
    final pref = await SharedPreferences.getInstance();
    final List<Tag> currentTagList = await fetchAll();

    if (!currentTagList.any((tag) => tag.id == entity.id)) return;

    final int index = currentTagList.indexWhere((tag) => tag.id == entity.id);
    currentTagList[index] = entity;

    final List<Map<String, dynamic>> jsonList =
        currentTagList.map((tag) => tag.toJson()).toList();

    await pref.setString(prefKey, jsonEncode(jsonList));
  }

  @override
  Future<List<Tag>> fetchAll() async {
    final pref = await SharedPreferences.getInstance();
    if (!pref.containsKey(prefKey)) {
      await pref.setString(prefKey, "");
      return [];
    }

    final String value = pref.getString(prefKey);
    if (value.isEmpty) return [];

    final List<Tag> valueList = [];
    final List<dynamic> entityList = jsonDecode(value);
    for (dynamic entity in entityList) valueList.add(Tag.fromJson(entity));

    return valueList;
  }
}
