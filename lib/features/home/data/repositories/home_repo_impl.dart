import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reusable/core/helpers/response_wrapper.dart';

import '../../domain/repositories/home_repo.dart';
import '../../domain/use_cases/get_products_use_case.dart';
import '../data_sources/home_datasource.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeDatasource _dataSource;

  const HomeRepoImpl(this._dataSource);

  @override
  Future<Either<String, ResponseWrapper>> getProducts(
    GetProductsParams params,
  ) async {
    try {
      final response = await _dataSource.getProducts(params);
      return Right(response);
    } catch (e) {
      debugPrint("error in getProducts in HomeRepoImpl => $e");
      return Left(e.toString());
    }
  }
}
