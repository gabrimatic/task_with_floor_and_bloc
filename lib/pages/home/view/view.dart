import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_with_floor_and_bloc/pages/home/cubit/home_cubit.dart';
import 'package:task_with_floor_and_bloc/pages/home/view/widget.dart';
import 'package:task_with_floor_and_bloc/repository/base.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        RepositoryProvider.of<BaseTaskRepository>(context),
      )..getAllTasks(),
      lazy: true,
      child: const HomeWidget(),
    );
  }
}
