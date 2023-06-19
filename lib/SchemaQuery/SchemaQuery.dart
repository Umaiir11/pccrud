import 'package:sqflite/sqflite.dart';

class SchemaQuery {
  Future<void> FncSchemaQuries(Database lDatabase) async {
    //CreateTab1
    await lDatabase.execute('''
      CREATE TABLE IF NOT EXISTS TBU_SalesInfo (
        ID INTEGER ,
        PKGUID TEXT PRIMARY KEY,
        CustID TEXT,
        Voucher TEXT,
        GrandTotal TEXT,
        Operation INTEGER
      )
    ''');
    //CreateTab1
    await lDatabase.execute('''
      CREATE TABLE IF NOT EXISTS TBU_SalesDetails (
        ID INTEGER ,
        PKGUID TEXT PRIMARY KEY,
        VmDID TEXT,
        Item TEXT,
        Quantity TEXT,
        Rate INTEGER,
        Operation INTEGER
      )
    ''');

    await lDatabase.execute('''
      CREATE TABLE IF NOT EXISTS TBU_Customer (
        ID INTEGER , 
        Operation INTEGER ,
        PKGUID TEXT PRIMARY KEY,
        CustID TEXT,
        CB TEXT,
        ISD TEXT
       )
    ''');


    //Altertable1
    await FncCheckAndAddColumns(lDatabase, 'TBU_SalesInfo', {
      'DATA': 'INTEGER',
    });
    await FncCreateView(lDatabase, 'TBU_SalesInfo');
    //Altertable1
    await FncCheckAndAddColumns(lDatabase, 'TBU_SalesDetails', {
      'DATA': 'INTEGER',
    });
    await FncCreateView(lDatabase, 'TBU_SalesDetails');

    await FncCreateView(lDatabase, 'TBU_Customer');
  }

  Future<void> FncCheckAndAddColumns(Database lDatabase, String lTablename, Map<String, String> lColumnstoadd) async {
    List<Map<String, dynamic>> lExistingcolumns = await lDatabase.rawQuery('PRAGMA table_info($lTablename)');
    List<String> lExistingcolumnnames = lExistingcolumns.map((column) => column['name'] as String).toList();

    List<String> lNewcolumnnames =
    lColumnstoadd.keys.where((columnName) => !lExistingcolumnnames.contains(columnName)).toList();

    for (String columnName in lNewcolumnnames) {
      String columnType = lColumnstoadd[columnName]!;
      await lDatabase.execute('ALTER TABLE $lTablename ADD COLUMN $columnName $columnType');
    }
  }

  Future<void> FncCreateView(Database lDatabase, String lTablename) async {
    await lDatabase.execute('DROP VIEW IF EXISTS   VW_$lTablename');

    await lDatabase.execute('''
      CREATE VIEW VW_$lTablename AS
      SELECT *
      FROM $lTablename Where ISD = 'false'
    ''');
  }
}
