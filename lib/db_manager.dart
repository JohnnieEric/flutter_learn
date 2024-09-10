import 'package:flutter_learn_demo/templeblock/history/bean/merit_record_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbManager {
  DbManager._();

  static DbManager? _dbManager;
  late Database _dataBase;

  static DbManager get instance {
    _dbManager = _dbManager ?? DbManager._();
    return _dbManager!;
  }

  late MeritRecordDao _meritRecordDao;

  MeritRecordDao get meritRecordDao => _meritRecordDao;

  Future<void> open() async {
    String databasePath = await getDatabasesPath();
    String dbPath = join(databasePath, 'flutter_learn.db');
    _dataBase = await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    _meritRecordDao = MeritRecordDao(_dataBase);
  }

  void _onCreate(Database db, int version) async {
    await MeritRecordDao.createTable(db);
  }
}
