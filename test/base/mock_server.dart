import 'dart:collection';

import 'package:mock_web_server/mock_web_server.dart';

class MockServer {
  final MockWebServer server = new MockWebServer();
  final Map<String, MockResponse> resMap = LinkedHashMap();
  MockServer() {
    server.dispatcher = (request) async {
      final res = resMap[request.uri.path];
      if (res != null) {
        return res;
      }
      return MockResponse()..httpCode = 404;
    };
  }

  start() async {
    server.start();
  }

  void shutdown() {
    server.shutdown();
  }

  void addResponse(String path, MockResponse response) {
    resMap[path] = response;
  }
}
