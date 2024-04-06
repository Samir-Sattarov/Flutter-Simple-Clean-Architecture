import 'package:dartz/dartz.dart';
import 'package:new_architecture/app_core/entities/app_error.dart';
import 'package:new_architecture/app_core/entities/no_params.dart';

import '../../../../app_core/usecases/usecase.dart';
import '../entities/test_entity.dart';
import '../repository/empty_repository.dart';

class GetTestData extends UseCase<TestEntity, NoParams> {
  final EmptyRepository _repository;

  GetTestData(this._repository);

  @override
  Future<Either<AppError, TestEntity>> call(NoParams params) {
    return _repository.getTest();
  }
}
