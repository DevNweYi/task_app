import 'package:floor/floor.dart';

@Entity(tableName: 'title')
class Title{
  @PrimaryKey(autoGenerate: true)
  int? titleId;
  String? titleName;
  String? imageName;
  int? totalTask;
  Title({this.titleId,this.titleName,this.imageName,this.totalTask});
}