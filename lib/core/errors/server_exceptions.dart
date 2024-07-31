import 'dart:io';

import 'package:dio/dio.dart';

import 'base_app_exception.dart';

ServerException handleException(dynamic e) {
  if (e is DioException) {
    return ServerException.fromDiorError(e);
  } else if (e is SocketException) {
    return ServerException('No Internet Connection');
  } else {
    return ServerException('There was an error , please try again');
  }
}

class ServerException extends BaseAppException {
  ServerException(String message) : super(message: message);

  factory ServerException.fromDiorError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerException('Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerException('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerException('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerException('badCertificate with api server');
      case DioExceptionType.badResponse:
        return ServerException.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerException('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerException('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerException('Oops There was an Error, Please try again');
    }
  }

  factory ServerException.fromResponse(int statusCode, dynamic response) {
    final String message = response['message'];
    if (message == "unauthorized") {
      return ServerException('غير مصرح');
    }
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerException(message);
      case 404: // notFound
        return ServerException('Your request was not found, please try later');
      case 500:
        return ServerException(
          'There is a problem with server, please try later',
        );
      default:
        return ServerException('There was an error , please try again');
    }
  }
}
