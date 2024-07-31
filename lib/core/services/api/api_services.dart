import 'dart:io';

abstract class ApiServices {
  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> post({
    required String endPoint,
    Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> patch({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> delete({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> postRequestWithFile({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
    File? file,
    List<File>? files,
  });
}
