import 'package:dio/dio.dart';

typedef OnDataFetch = Future<ResponseBody> Function();

class HttpAdapter extends DefaultHttpClientAdapter {
  @override
  Future<ResponseBody> fetch(RequestOptions options,
      Stream<List<int>> requestStream, Future cancelFuture) {
    return super.fetch(options, requestStream, cancelFuture);
  }
}
