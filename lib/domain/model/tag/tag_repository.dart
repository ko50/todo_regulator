import 'package:todo_regulator/domain/model/tag/tag.dart';

abstract class TagRepository {
  Future<void> create(Tag entity);

  Future<void> delete(String id);

  Future<void> update(Tag entity);

  Future<List<Tag>> fetchAll();
}
