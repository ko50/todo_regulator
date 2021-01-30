import 'package:todo_regulator/domain/model/tag/tag.dart';
import 'package:todo_regulator/domain/model/tag/tag_repository.dart';

class TestTagRepository implements TagRepository {
  static final List<Tag> _mock = [
    Tag(),
  ];

  @override
  Future<void> create(Tag entity) async => Future.delayed(Duration(seconds: 3));

  @override
  Future<void> delete(String id) async => Future.delayed(Duration(seconds: 3));

  @override
  Future<void> update(Tag entity) async => Future.delayed(Duration(seconds: 3));

  @override
  Future<List<Tag>> fetchAll() async => Future.delayed(
        Duration(seconds: 3),
        () => _mock,
      );
}
