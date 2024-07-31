abstract class BaseAppException {
  final String message;
  final int? statusCode;

  const BaseAppException({required this.message, this.statusCode});
}
