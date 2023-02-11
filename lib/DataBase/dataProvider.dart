import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:statemanagement/DataBase/model.dart';

final String columnId = 'id';
final String columnname = 'name';
final String columnemail = 'email';
final String columnimageUrl = 'imageUrl';
final String columnnumber = 'number';
final String columnpassword = 'password';

class DataProvider {
  late Database db;
  static final DataProvider instance = DataProvider._internal();

  factory DataProvider() {
    return instance;
  }
  DataProvider._internal();

  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'data.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
create table DataTable ( 
$columnId  integer primary key autoincrement,
$columnname text not null,
$columnemail text not null,
$columnimageUrl text ,
$columnnumber text not null,
$columnpassword text not null
  )
''');
    });
  }

  Future<MyModel> insert(MyModel model) async {
    model.id = await db.insert('DataTable', model.toMap());
    return model;
  }

  Future<List<MyModel>> getData() async {
    List<Map<String, dynamic>> maps = await db.query('DataTable');
    if (maps.isEmpty)
      return [];
    else {
      List<MyModel> data = [];
      maps.forEach((element) {
        data.add(MyModel.fromMap(element as Map<String, dynamic>));
      });
      return data;
    }
  }

  Future<int> delete(int? id) async {
    return await db.delete('DataTable', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(MyModel model) async {
    return await db.update('DataTable', model.toMap(),
        where: '$columnId = ?', whereArgs: [model.id]);
  }

  Future close() async => db.close();
}
