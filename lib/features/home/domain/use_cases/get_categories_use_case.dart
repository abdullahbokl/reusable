import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/usecases/usecase.dart';
import '../../../../core/helpers/response_wrapper.dart';
import '../repositories/home_repo.dart';

@lazySingleton
class GetCategoriesUsecase
    extends Usecase<Either<String, ResponseWrapper>, GetCategoriesParams> {
  GetCategoriesUsecase(this._repository);

  final HomeRepo _repository;

  @override
  Future<Either<String, ResponseWrapper>> call(
    GetCategoriesParams params,
  ) async {
    return await _repository.getCategories(params);
  }
}

class GetCategoriesParams {
  const GetCategoriesParams();
}
