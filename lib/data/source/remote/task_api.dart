import 'package:flutter_todo/data/entity/task.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'task_api.g.dart';

@RestApi()
abstract class TaskApi {
  factory TaskApi(Dio dio) = _TaskApi;

  @GET("/tasks")
  Future<List<Task>> getTasks();

  @GET("/task/{id}")
  Future<Task> getTask(@Path("id") int id);

  @POST("/tasks")
  Future<Task> saveTask(@Body() Task task);
}
