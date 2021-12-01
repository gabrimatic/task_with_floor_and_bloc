import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_with_floor_and_bloc/app.dart';
import 'package:task_with_floor_and_bloc/pages/home/cubit/home_cubit.dart';
import 'package:task_with_floor_and_bloc/pages/home/models/task.dart';
import 'package:task_with_floor_and_bloc/repository/base.dart';
import 'package:task_with_floor_and_bloc/repository/mock.dart';

void main() {
  group('Test', () {
    late Task task;
    late BaseTaskRepository taskRepository;

    setUpAll(() async {
      taskRepository = MockTaskRepository();
      task = const Task(title: 'Test1', description: 'Description 1');
    });

    testWidgets('Running app with no item in db.', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          AppWidget(
            taskRepository: taskRepository,
          ),
        );

        expect(find.text('No task found!'), findsOneWidget);
      });
    });

    testWidgets('Add and remove new item to the db and list', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          AppWidget(
            taskRepository: taskRepository,
          ),
        );

        final context = tester.element(find.byType(FloatingActionButton));

        /// Adding
        await context.read<HomeCubit>().addNewTask(task);
        await tester.pump();
        expect(find.byType(ListTile), findsOneWidget);

        /// Removing
        await tester.tap(find.byType(IconButton));
        await Future.delayed(const Duration(seconds: 2));
        await tester.pump();
        expect(find.byType(ListTile), findsNothing);
      });
    });
  });
}
