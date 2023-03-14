class ApiResponse<T> {
  final int code;
  final String message;
  final List<String> errors;
  final T data;

  ApiResponse._({
    required this.code,
    required this.message,
    required this.errors,
    required this.data,
  });

  factory ApiResponse.fromMap(
    Map<String, dynamic> map, {
    required T Function(dynamic data) builder,
  }) {
    return ApiResponse<T>._(
      code: map['code'] ?? 0,
      message: map['message'] ?? '',
      errors: (map['errors'] as List)
          .map<String>((error) => error['value'])
          .toList(),
      data: builder(map['data']),
    );
  }
}
