import 'package:floor/floor.dart';

@entity
class Task {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? title;
  final String? description;

  const Task({
    this.id,
    this.title,
    this.description,
  });
}
