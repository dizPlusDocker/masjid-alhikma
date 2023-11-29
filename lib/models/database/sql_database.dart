import 'package:com_alhikma_moschee/views/constants/app_constant.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLDB {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    } else {
      return _db;
    }
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, AppConstants.dataBaseName);
    Database myDb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return myDb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {}

  _onCreate(Database db, int version) async {
    await db.execute(
      '''
        CREATE TABLE "sebha" (
          "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
          "count" INTEGER NOT NULL,
          "title" TEXT NOT NULL
        );
      ''',
    );
  }

  readData(String sql) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(sql);
    return response;
  }

  myDeleteDataBase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, AppConstants.dataBaseName);
    await deleteDatabase(path);
  }
}
