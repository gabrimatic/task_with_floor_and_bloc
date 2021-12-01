import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_with_floor_and_bloc/pages/home/view/view.dart';
import 'package:task_with_floor_and_bloc/repository/base.dart';

class AppWidget extends StatelessWidget {
  final BaseTaskRepository taskRepository;
  const AppWidget({
    required this.taskRepository,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => taskRepository,
      child: const MaterialApp(
        title: 'TaskManager',
        home: HomeView(),
      ),
    );
  }
}
