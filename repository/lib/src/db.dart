/// run "flutter packages pub run build_runner build" to generate [db.g.dart]
import 'dart:async'; // // Must be imported

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite; // Must be imported

import 'task_dao.dart';
import 'task_entity.dart';

part 'db.g.dart';

@Database(version: 1, entities: [Task])
abstract class AppDatabase extends FloorDatabase {
  TaskDao get taskDao;
}
