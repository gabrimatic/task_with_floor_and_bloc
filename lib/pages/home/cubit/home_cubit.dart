import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_with_floor_and_bloc/pages/home/models/task.dart';
import 'package:task_with_floor_and_bloc/repository/base.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BaseTaskRepository _taskRepository;
  HomeCubit(this._taskRepository) : super(HomeInitial());

  Future<void> getAllTasks() async {
    emit(HomeLoading());

    final list = await _taskRepository.getAllTasks();
    emit(HomeLoaded(list));
  }

  Future<int> addNewTask(Task task) async {
    final status = await _taskRepository.addNewTask(task);
    if (status > 0) {
      emit(
        HomeLoaded(
          (state as HomeLoaded).taskList
            ..add(
              task.copyWith(id: status),
            ),
        ),
      );
    }

    return status;
  }

  Future<void> removeTask(Task task) async {
    final status = await _taskRepository.removeTask(task);
    if (status > 0) {
      emit(
        HomeLoaded(
          (state as HomeLoaded).taskList
            ..removeWhere(
              (e) => e.id == task.id,
            ),
        ),
      );
    }
  }
}
