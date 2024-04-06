import '../entities/test_entity.dart';

class TestModel extends TestEntity {
  const TestModel({required super.title});

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      title: json['title'],
    );
  }
}
