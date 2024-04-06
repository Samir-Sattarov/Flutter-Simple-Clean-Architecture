import '../models/test_model.dart';

abstract class EmptyRemoteDataSource {
  Future<TestModel> getTest();
}

class EmptyRemoteDataSourceImpl extends EmptyRemoteDataSource {
  // final ApiClient _client;

  // EmptyDataRemoteDataSourceImpl(this._client);

  @override
  Future<TestModel> getTest() async {
    throw UnimplementedError();
  }
}
