import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'data/source/remote/remote_data_source.dart';
import 'data/source/remote/task_api.dart';
import 'data/tasks_repository_impl.dart';

final logger = Logger();
final dio = Dio(BaseOptions(baseUrl: "http://localhost:3000"));
final repo = TasksRepositoryImpl(RemoteDataSource(TaskApi(dio)));
