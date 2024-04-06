import '../models/test_model.dart';

abstract class EmptyRemoteDataSource {
  Future<TestModel> getTest();
}
