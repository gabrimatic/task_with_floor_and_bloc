import 'package:equatable/equatable.dart';
import 'package:task_repository/task_repository.dart' as task_repository;

class Task extends Equatable {
  final int? id;
  final String? title;
  final String? description;

  @override
  List<Object?> get props => [id, title, description];

  const Task({
    this.id,
    this.title,
    this.description,
  });

  factory Task.fromRepository(task_repository.Task task) {
    return Task(
      id: task.id,
      title: task.title,
      description: task.description,
    );
  }

  Task copyWith({
    int? id,
    String? title,
    String? description,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
      );
}
