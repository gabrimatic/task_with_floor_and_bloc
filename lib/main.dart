import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task_repository/task_repository.dart';
import 'package:task_with_floor_and_bloc/app.dart';
import 'package:task_with_floor_and_bloc/repository/task.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = await $FloorAppDatabase.databaseBuilder('app_db.db').build();
  GetIt.I.registerSingleton<AppDatabase>(db);
  await GetIt.I.allReady();

  runApp(
    AppWidget(
      taskRepository: TaskRepository(),
    ),
  );
}
