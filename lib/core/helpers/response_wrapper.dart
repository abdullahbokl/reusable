class ResponseWrapper<T> {
  final T data;
  final String? status;
  final String? code;
  final int? total;
  final int? skip;
  final int? limit;

  const ResponseWrapper({
    required this.data,
    this.status,
    this.code,
    this.total,
    this.skip,
    this.limit,
  });

  factory ResponseWrapper.fromJson(
    Map<String, dynamic> response, {
    String? dataKey,
  }) {
    return ResponseWrapper(
      data: response[dataKey ?? 'data'],
      status: response['result'],
      code: response['code'],
      total: response['total'],
      skip: response['skip'],
      limit: response['limit'],
    );
  }

  ResponseWrapper copyWith({
    T? data,
    String? status,
    String? code,
    int? total,
    int? skip,
    int? limit,
  }) {
    return ResponseWrapper(
      data: data ?? this.data,
      status: status ?? this.status,
      code: code ?? this.code,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }
}
