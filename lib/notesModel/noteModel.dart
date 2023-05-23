// ignore_for_file: file_names

import 'package:hive_flutter/adapters.dart';
part 'noteModel.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? subTitle;
  @HiveField(2)
  String? date;

  NoteModel({this.title, this.subTitle, this.date});
}
