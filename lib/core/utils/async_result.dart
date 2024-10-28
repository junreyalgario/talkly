enum TaskStatus { initial, loading, success, error }

class AsyncTask<T> {
  final TaskStatus? status;
  final T? data;
  final String? message;

  AsyncTask({this.status, this.data, this.message});
}
