enum StateStatus { initial, loading, success, failure, empty }

extension StateStatusExtension on StateStatus {
  bool get isLoading => this == StateStatus.loading;

  bool get isFailed => this == StateStatus.failure;

  bool get isSuccess => this == StateStatus.success;

  bool get isEmpty => this == StateStatus.empty;
}
