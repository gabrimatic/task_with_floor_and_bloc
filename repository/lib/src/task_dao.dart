import 'package:floor/floor.dart';

import 'task_entity.dart';

@dao
abstract class TaskDao {
  @Query('SELECT * FROM Task')
  Future<List<Task>> getAllTasks();

  @insert
  Future<int> addTask(Task newTask);

  @delete
  Future<int> removeTask(Task task);
}
