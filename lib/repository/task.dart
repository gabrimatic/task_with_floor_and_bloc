import 'package:get_it/get_it.dart';
import 'package:task_repository/task_repository.dart' as repository;
import 'package:task_with_floor_and_bloc/pages/home/models/task.dart';
import 'package:task_with_floor_and_bloc/repository/base.dart';

class TaskRepository extends BaseTaskRepository {
  @override
  Future<int> addNewTask(Task task) async {
    final res = await GetIt.I<repository.AppDatabase>().taskDao.addTask(
          repository.Task(
            title: task.title,
            description: task.description,
          ),
        );

    return res;
  }

  @override
  Future<List<Task>> getAllTasks() async {
    final res = await GetIt.I<repository.AppDatabase>().taskDao.getAllTasks();
    return res.map((e) => Task.fromRepository(e)).toList();
  }

  @override
  Future<int> removeTask(Task task) async {
    final res = await GetIt.I<repository.AppDatabase>().taskDao.removeTask(
          repository.Task(
            id: task.id,
            title: task.title,
            description: task.description,
          ),
        );

    return res;
  }
}
