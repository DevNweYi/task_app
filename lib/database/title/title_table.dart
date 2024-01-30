import 'package:floor/floor.dart';

@Entity(tableName: 'title')
class Title{
  @PrimaryKey(autoGenerate: true)
  int titleId;
  String titleName;
  Title({required this.titleId,required this.titleName});
}