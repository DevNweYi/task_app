import 'package:floor/floor.dart';

@Entity(tableName: 'task')
class Task{
  @PrimaryKey(autoGenerate: true)
  int? taskId;
  int? titleId;
  String? taskName;
  Task({this.taskId,this.titleId,this.taskName});
}