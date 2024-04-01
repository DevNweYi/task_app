import 'package:floor/floor.dart';
import 'package:task_app/database/task/task_table.dart';

@dao
abstract class TaskDao{

  @Query("select * from task where titleId=:titleId")
  Stream<List<Task>> getTask(int titleId);

  @Query("select * from task where taskId=:taskId")
  Future<Task?> getTaskByTaskID(int taskId);

  @insert
  Future<void> addTask(Task task);

  @delete
  Future<void> deleteTask(Task task);

  @update
  Future<void> updateTask(Task task);

  @delete
  Future<void> deleteAllTask(List<Task> tasks);
}