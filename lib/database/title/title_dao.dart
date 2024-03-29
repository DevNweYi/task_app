import 'package:floor/floor.dart';
import 'package:task_app/database/title/title_table.dart';

@dao
abstract class TitleDao{

  @Query("select * from title")
  Stream<List<Title>> getAllTitle();

  @Query("select * from title where titleId=:titleId")
  Future<Title?> getTitle(int titleId);

  @insert
  Future<void> addTitle(Title title);

  @delete
  Future<void> deleteTitle(Title title);

  @update
  Future<void> updateTitle(Title title);

  @delete
  Future<void> deleteAllTitle(List<Title> titles);

}