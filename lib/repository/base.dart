import 'package:task_with_floor_and_bloc/pages/home/models/task.dart';

abstract class BaseTaskRepository {
  Future<List<Task>> getAllTasks();
  Future<int> addNewTask(Task task);
  Future<int> removeTask(Task task);
}
