import 'package:floor/floor.dart';
import 'package:task_app/database/task/task_dao.dart';
import 'package:task_app/database/task/task_table.dart';
import 'package:task_app/database/title/title_dao.dart';
import 'package:task_app/database/title/title_table.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';

@Database(version: 1, entities: [Title,Task])
abstract class AppDatabase extends FloorDatabase{
  TitleDao get titleDao;
  TaskDao get taskDao;
}