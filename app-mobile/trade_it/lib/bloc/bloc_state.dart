class BlocState<T> {
  T? data;
  String? error;
  bool isLoading, hasData, hasError,isFav;
  BlocState({
    this.data,
    this.error,
    this.hasData = false,
    this.hasError = false,
    this.isLoading = false,
    this.isFav = false,
  });
}
