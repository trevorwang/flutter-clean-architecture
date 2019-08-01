import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'app.dart';
import 'injection.dart';

void main() {
  dio.interceptors.add(LogInterceptor(responseBody: false));
  runApp(createApp(repo));
}
