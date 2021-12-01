import 'package:flutter_test/flutter_test.dart';
import 'package:task_repository/src/db.dart';
import 'package:task_repository/task_repository.dart';

void main() {
  group('Testing databse main functions...', () {
    late AppDatabase database;
    late Task task;

    Future<int> getAllCount() async {
      final list = await database.taskDao.getAllTasks();
      return list.length;
    }

    setUpAll(() async {
      task = const Task(title: 'Test 1', description: 'Description 1');
      database = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
    });

    tearDownAll(() {
      database.close();
    });

    test('Geting all tasks', () async {
      expect((await getAllCount()), 0);
    });

    test('Adding a task', () async {
      final id = await database.taskDao.addTask(task);
      task = Task(id: id, title: task.title, description: task.description);

      expect((await getAllCount()), 1);
    });

    test('Removing task', () async {
      await database.taskDao.removeTask(task);
      expect((await getAllCount()), 0);
    });
  });
}
