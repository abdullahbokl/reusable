import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/usecases/usecase.dart';
import '../../../../core/helpers/response_wrapper.dart';
import '../repositories/home_repo.dart';

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

class GetProductsParams {
  final int limit;
  final int skip;
  final String select;

  const GetProductsParams({
    this.limit = 10,
    this.skip = 0,
    this.select =
        'id,title,price,description,category,rating,tags,brand,thumbnail',
  });

  Map<String, dynamic> toParams() {
    return {
      'limit': limit,
      'skip': skip,
      'select': select,
    };
  }
}
