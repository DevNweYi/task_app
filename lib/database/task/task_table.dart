import 'package:floor/floor.dart';

@Entity(tableName: 'task')
class Task{
  @PrimaryKey(autoGenerate: true)
  int taskId;
  int titleId;
  String taskName;
  Task({required this.taskId,required this.titleId,required this.taskName});
}