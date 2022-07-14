class BlocState<T> {
  T? data;
  String? error;
  bool isLoading, hasData, hasError;
  BlocState({
    this.data,
    this.error,
    this.hasData = false,
    this.hasError = false,
    this.isLoading = false,
  });
}
