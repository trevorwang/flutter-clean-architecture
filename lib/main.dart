import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'app.dart';
import 'injection.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  dio.interceptors.add(LogInterceptor(responseBody: false));
  runApp(createApp(repo));
}
