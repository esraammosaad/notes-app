import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel extends HiveObject {
  @HiveField(0)
   String title;
  @HiveField(1)
   String content;
  @HiveField(2)
  final String time;
  @HiveField(3)
   int color;
  NoteModel( {required this.title, required this.content, required this.time,required this.color});
}
//flutter packages pub run build_runner build