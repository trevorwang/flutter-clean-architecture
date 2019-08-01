import 'package:flutter_todo/data/entity/task.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'task_api.g.dart';

@RestApi()
abstract class TaskApi {
  factory TaskApi(Dio dio) = _TaskApi;

  @GET("/todo")
  Future<List<Task>> getTasks();

  @GET("/todo/{id}")
  Future<Task> getTask(@Path("id") int id);

  @POST("/todo")
  Future<Task> saveTask(@Body() Task task);
}
