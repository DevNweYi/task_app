import 'package:floor/floor.dart';

@Entity(tableName: 'title')
class Title{
  @PrimaryKey(autoGenerate: true)
  int titleId;
  String titleName;
  String imageName;
  Title({required this.titleId,required this.titleName,required this.imageName});
}