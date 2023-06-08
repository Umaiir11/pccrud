import 'package:sqflite/sqflite.dart';

class SchemaQuery {
  Future<void> FncSchemaQuries(Database lDatabase) async {
    //CreateTab1
    await lDatabase.execute('''
      CREATE TABLE IF NOT EXISTS TBUSalesInfo (
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
      CREATE TABLE IF NOT EXISTS TBUSalesDetails (
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
      CREATE TABLE IF NOT EXISTS TBUCustomer (
        ID INTEGER , 
        Operation INTEGER ,
        PKGUID TEXT PRIMARY KEY,
        CustID TEXT,
        CB TEXT,
        ISD TEXT
       )
    ''');


    //Altertable1
    await FncCheckAndAddColumns(lDatabase, 'TBUSalesInfo', {
      'DATA': 'INTEGER',
    });
    await FncCreateView(lDatabase, 'TBUSalesInfo');
    //Altertable1
    await FncCheckAndAddColumns(lDatabase, 'TBUSalesDetails', {
      'DATA': 'INTEGER',
    });
    await FncCreateView(lDatabase, 'TBUSalesDetails');
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
    await lDatabase.execute('DROP VIEW IF EXISTS ${lTablename}View');

    await lDatabase.execute('''
      CREATE VIEW ${lTablename}View AS
      SELECT *
      FROM $lTablename
    ''');
  }
}
