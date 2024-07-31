import 'package:dartz/dartz.dart';
import 'package:reusable/core/helpers/response_wrapper.dart';

import '../use_cases/get_products_use_case.dart';

abstract class HomeRepo {
  Future<Either<String, ResponseWrapper>> getProducts(GetProductsParams params);
}
