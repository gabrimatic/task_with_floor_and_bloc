import 'package:task_with_floor_and_bloc/pages/home/models/task.dart';
import 'package:task_with_floor_and_bloc/repository/base.dart';

class MockTaskRepository extends BaseTaskRepository {
  var _tasks = <Task>[];

  @override
  Future<int> addNewTask(Task task) {
    _tasks.add(task.copyWith(id: _tasks.isEmpty ? 1 : _tasks.last.id));
    return Future.value(_tasks.last.id);
  }

  @override
  Future<List<Task>> getAllTasks() {
    return Future.value(_tasks.map((e) => e.copyWith()).toList());
  }

  @override
  Future<int> removeTask(Task task) {
    _tasks = _tasks
      ..removeWhere(
        (e) => e.id == task.id,
      );
    return Future.value(1);
  }
}
