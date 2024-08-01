import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reusable/core/errors/base_app_exception.dart';
import 'package:reusable/core/helpers/response_wrapper.dart';
import 'package:reusable/core/services/api/api_services.dart';
import 'package:reusable/core/utils/end_points.dart';

import '../../domain/use_cases/get_products_use_case.dart';

abstract class HomeDatasource {
  Future<ResponseWrapper> getProducts(GetProductsParams params);
}

@LazySingleton(as: HomeDatasource)
class HomeDatasourceImpl implements HomeDatasource {
  final ApiServices _api;

  const HomeDatasourceImpl(this._api);

  @override
  Future<ResponseWrapper> getProducts(GetProductsParams params) async {
    try {
      final response = await _api.get(
        endPoint: EndPoints.products.getProducts,
        queryParameters: params.toParams(),
      );

      return ResponseWrapper.fromJson(response, dataKey: "products");
    } on BaseAppException catch (e) {
      debugPrint("error in getProducts in HomeDatasourceImpl => $e");
      throw e.message;
    }
  }
}
