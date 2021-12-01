import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_with_floor_and_bloc/pages/home/cubit/home_cubit.dart';
import 'package:task_with_floor_and_bloc/pages/home/models/task.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded == false ||
              (state as HomeLoaded).taskList.isEmpty) {
            return const Center(
              child: Text('No task found!'),
            );
          }

          final list = state.taskList;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(list[i].title!),
                subtitle: Text(list[i].description!),
                isThreeLine: true,
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {
                    context.read<HomeCubit>().removeTask(list[i]);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add task'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              String title = '';
              String description = '';

              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Title'),
                        ),
                        onChanged: (value) {
                          title = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Description'),
                        ),
                        onChanged: (value) {
                          description = value;
                        },
                      ),
                      const SizedBox(height: 16),
                      FlatButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        shape: const StadiumBorder(),
                        onPressed: () {
                          if (title.isEmpty || description.isEmpty) return;

                          context.read<HomeCubit>().addNewTask(
                                Task(
                                  title: title,
                                  description: description,
                                ),
                              );

                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
