import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:practica4/models/task_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AgendaDB {
  static final nameDB = 'AGENDADB';
  static final versionDB = 1;

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database!;
    return _database = await _initDatabase();
  }

  Future<Database?> _initDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path, nameDB);
    return openDatabase(pathDB, version: versionDB, onCreate: _createTables);
  }

  FutureOr<void> _createTables(Database db, int version) {
    String query = '''
    CREATE TABLE carrera( 
      id_carrera INTEGER PRIMARY KEY,
      carrera VARCHAR(100),
    );

    CREATE TABLE profesor( 
      id_profesor INTEGER PRIMARY KEY,
      profesor VARCHAR(200),
      email VARCHAR(200),
      id_carrera INTEGER,
      FOREIGN KEY(id_carreara) REFERENCES carrera(id_carrera)
    );
    CREATE TABLE tarea( 
      idTarea INTEGER PRIMARY KEY,
      tarea VARCHAR(50),
      fecha_expiracion DATETIME,
      fecha_recordatorio DATETIME,
      descripcion TEXT,
      realizada INTEGER,
      id_profesor INTEGER,
        FOREIGN KEY(id_profesor) REFERENCES profesor(id_profesor)
    );

    ''';
    db.execute(query);
  }

  Future<int> INSERT(String tblName, Map<String, dynamic> data) async {
    var conexion = await database;
    return conexion!.insert(tblName, data);
  }

  Future<int> UPDATE(String tblName, Map<String, dynamic> data) async {
    var conexion = await database;
    return conexion!.update(tblName, data,
        where: 'idTask = ?', whereArgs: [data['idTask']]);
  }

  Future<int> DELETE(String tblName, int idTask) async {
    var conexion = await database;
    return conexion!.delete(tblName, where: 'idTask = ?', whereArgs: [idTask]);
  }

  Future<List<TaskModel>> GETALLTASK() async {
    var conexion = await database;
    var result = await conexion!.query('tblTareas');
    return result.map((task) => TaskModel.fromMap(task)).toList();
  }
}
