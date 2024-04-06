import '../models/test_model.dart';
import 'empty_remote_data_source.dart';

class EmptyRemoteDataSourceImpl extends EmptyRemoteDataSource {
  // final ApiClient _client;

  // EmptyDataRemoteDataSourceImpl(this._client);

  @override
  Future<TestModel> getTest() async {
    throw UnimplementedError();
  }
}
