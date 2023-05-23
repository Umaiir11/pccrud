import 'package:sqflite/sqflite.dart';

class SchemaQuery {
  Future<void> FncCreateTable(Database l_DataBase) async {
    await l_DataBase.execute('''
      CREATE TABLE IF NOT EXISTS TBUSalesInfo (
        ID INTEGER ,
        PKGUID TEXT PRIMARY KEY,
        CustID TEXT,
        Voucher TEXT,
        GrandTotal TEXT,
        Operation INTEGER
      )
    ''');

 await l_DataBase.execute('''
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

    await FncCheckAndAddColumns(l_DataBase, 'TBUSalesInfo', {
      'DATA': 'INTEGER',

    });
    await FncCreateView(l_DataBase, 'TBUSalesInfo');

    await FncCheckAndAddColumns(l_DataBase, 'TBUSalesDetails', {
      'DATA': 'INTEGER',

    });
    await FncCreateView(l_DataBase, 'TBUSalesDetails');



  }

  Future<void> FncCheckAndAddColumns(Database l_DataBase, String l_TableName, Map<String, String> l_ColumnsToAdd) async {
    List<Map<String, dynamic>> l_ExistingColumns = await l_DataBase.rawQuery('PRAGMA table_info($l_TableName)');
    List<String> l_ExistingColumnNames = l_ExistingColumns.map((column) => column['name'] as String).toList();

    List<String> l_NewColumnNames =
    l_ColumnsToAdd.keys.where((columnName) => !l_ExistingColumnNames.contains(columnName)).toList();

    for (String columnName in l_NewColumnNames) {
      String columnType = l_ColumnsToAdd[columnName]!;
      await l_DataBase.execute('ALTER TABLE $l_TableName ADD COLUMN $columnName $columnType');
    }
  }

  Future<void> FncCreateView(Database l_DataBase, String l_TableName) async {
    await l_DataBase.execute('DROP VIEW IF EXISTS ${l_TableName}View');

    await l_DataBase.execute('''
      CREATE VIEW ${l_TableName}View AS
      SELECT *
      FROM $l_TableName
    ''');
  }
}
