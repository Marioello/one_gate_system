class APIResponse<T> {
  T? data;
  bool error;
  String errorMessage;

  APIResponse({
    this.data,
    required this.error,
    required this.errorMessage,
  });
}
