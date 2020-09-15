import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@module
abstract class SqfliteModule {
  @singleton
  Future<Database> database() async => await openDatabase(
    join(await getDatabasesPath(), 'app.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE contact(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, address TEXT, phone TEXT, mail TEXT, sex TEXT)",
      );
    },
    version: 1,
  );
}
