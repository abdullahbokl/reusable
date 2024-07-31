import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:reusable/core/common/usecases/usecase.dart';
import 'package:reusable/core/helpers/response_wrapper.dart';
import 'package:reusable/features/home/domain/repositories/home_repo.dart';

@lazySingleton
class GetProductsUsecase
    extends Usecase<Either<String, ResponseWrapper>, GetProductsParams> {
  GetProductsUsecase(this._repository);

  final HomeRepo _repository;

  @override
  Future<Either<String, ResponseWrapper>> call(
    GetProductsParams params,
  ) async {
    return await _repository.getProducts(params);
  }
}

// ?limit=10&skip=10&select=title,price

class GetProductsParams {
  final int limit;
  final int skip;
  final String select;

  const GetProductsParams({
    this.limit = 10,
    this.skip = 0,
    this.select = 'title,price',
  });
}
