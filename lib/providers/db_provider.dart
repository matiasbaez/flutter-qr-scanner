import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:qr_reader/models/models.dart';

class DBProvider {

  static Database? _database;
  static final DBProvider dbi = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    final path = join( documentsDir.path, 'ScansDB.db' );

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE scans(
            id INTEGER PRIMARY KEY,
            type TEXT,
            value TEXT
          );
        ''');
      }
    );
  }

  Future<int> newRawScan( ScanModel scan ) async {
    final id    = scan.id;
    final type  = scan.type;
    final value = scan.value;

    final db = await database;

    final result = await db!.rawInsert('''
      INSERT INTO scans( id, type, value )
      VALUES ( $id, '$type', '$value'  );
    ''');

    return result;
  }

  Future<int> newScan( ScanModel scan ) async {
    final db = await database;

    final result = await db!.insert('scans', scan.toJson());

    return result;
  }

  Future<ScanModel?> getScanById( int id ) async {
    final db = await database;

    final result = await db!.query('scans', where: 'id=?', whereArgs: [id]);

    return result.isNotEmpty ? ScanModel.fromJson(result.first) : null;
  }

  Future<List<ScanModel>> getAllScans( ) async {
    final db = await database;

    final results = await db!.query('scans');

    return results.isNotEmpty
      ? results.map((r) => ScanModel.fromJson(r)).toList()
      : [];
  }

  Future<List<ScanModel>> getScanByType( String type ) async {
    final db = await database;

    final results = await db!.query('scans', where: 'type=?', whereArgs: [type]);

    return results.isNotEmpty
      ? results.map((r) => ScanModel.fromJson(r)).toList()
      : [];
  }

  Future<int> updateScan( ScanModel scan ) async {
    final db = await database;

    final result = await db!.update('scans', scan.toJson(), where: 'id=?', whereArgs: [scan.id]);

    return result;
  }

  Future<int> deleteScan( int id ) async {
    final db = await database;

    final result = await db!.delete('scans', where: 'id=?', whereArgs: [id]);

    return result;
  }

  Future<int> deleteAllScans() async {
    final db = await database;

    final result = await db!.delete('scans');

    return result;
  }

}
