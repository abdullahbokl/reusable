import 'package:dio/dio.dart';

import '../../../utils/end_points.dart';
import './dio_interceptors.dart';

Dio dioInit() {
  final dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrls.url,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: Headers.jsonContentType,
    ),
  );
  dio.interceptors.add(DioInterceptors());
  return dio;
}
