import 'package:dartz/dartz.dart';
import 'package:new_architecture/app_core/usecases/action.dart';
import 'package:new_architecture/features/empty/core/datasources/empty_remote_data_source.dart';

import '../../../../app_core/entities/app_error.dart';
import '../entities/test_entity.dart';

abstract class EmptyRepository {
  Future<Either<AppError, TestEntity>> getTest();
}

class EmptyRepositoryImpl extends EmptyRepository {
  final EmptyRemoteDataSource _remoteDataSource;

  EmptyRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<AppError, TestEntity>> getTest() async {
    return action<TestEntity>(
      task: _remoteDataSource.getTest(),
    );
  }
}
