import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../errors/server_exceptions.dart';
import '../api_services.dart';

@LazySingleton(as: ApiServices)
class DioConsumer extends ApiServices {
  final Dio dio;

  DioConsumer(this.dio);

  @override
  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final res = await dio.get(
        endPoint,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return res.data;
    } catch (e) {
      throw handleException(e);
    }
  }

  @override
  Future post({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final res = await dio.post(
        endPoint,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return res.data;
    } catch (e) {
      throw handleException(e);
    }
  }

  @override
  Future patch({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final res = await dio.patch(
        endPoint,
        data: body,
        queryParameters: queryParameters,
      );
      return res.data;
    } catch (e) {
      throw handleException(e);
    }
  }

  @override
  Future delete({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      var res = await dio.delete(
        endPoint,
        data: body,
        queryParameters: queryParameters,
      );
      return res.data;
    } catch (e) {
      throw handleException(e);
    }
  }

  @override
  Future<dynamic> postRequestWithFile({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParameters,
    File? file,
    List<File>? files,
  }) async {
    try {
      final formData = FormData.fromMap(body);
      final preparedFiles = await _prepareFiles(file: file, files: files);
      formData.files.addAll(preparedFiles);

      final res = await dio.post(
        endPoint,
        data: formData,
        queryParameters: queryParameters,
        options: Options(
          sendTimeout: const Duration(minutes: 5),
          receiveTimeout: const Duration(minutes: 5),
        ),
      );
      return res.data;
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<List<MapEntry<String, MultipartFile>>> _prepareFiles({
    File? file,
    List<File>? files,
  }) async {
    final List<MapEntry<String, MultipartFile>> preparedFiles = [];

    if (file != null) {
      final fileMultipartFile = await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      );
      preparedFiles.add(MapEntry('file', fileMultipartFile));
    }

    if (files != null) {
      for (final file in files) {
        final fileMultipartFile = await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        );
        preparedFiles.add(MapEntry('files', fileMultipartFile));
      }
    }

    return preparedFiles;
  }
}
