class APIResponse<T> {
  APIResponse({this.data, this.error = false, this.errorMessage});

  final T data;
  final bool error;
  final String errorMessage;
}
