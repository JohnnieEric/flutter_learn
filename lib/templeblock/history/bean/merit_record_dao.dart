import 'package:flutter_learn_demo/templeblock/history/bean/merit_record.dart';
import 'package:sqflite/sqflite.dart';

class MeritRecordDao {
  final Database database;

  MeritRecordDao(this.database);

  static String tableName = 'merit_record';

  static String tableSql = """
CREATE TABLE $tableName (
id VARCHAR(64) PRIMARY KEY,
addMeritCount INTEGER, 
image TEXT,
sound TEXT,
timestamp INTEGER
)""";

  static Future<void> createTable(Database db) async {
    return db.execute(tableSql);
  }

  Future<void> insertRecord(MeritRecord record) async {
    final db = database;
    await db.insert(
      tableName,
      record.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<MeritRecord>> queryRecord() async {
    final db = database;
    final List<Map<String, dynamic>> recordMaps = await db.query(tableName);
    return recordMaps
        .map((e) => MeritRecord(
            e['id'].toString(),
            e['timestamp'] as int,
            e['addMeritCount'] as int,
            e['image'].toString(),
            e['sound'].toString()))
        .toList();
  }
}
