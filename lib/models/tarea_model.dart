class tareaModel {
  int? idTarea;
  String? tarea;
  DateTime? fecha_expiracion;
  DateTime? fecha_recordatorio;
  String? descripcion;
  int? realizada;
  int? id_profesor;

  tareaModel({
    this.idTarea,
    this.tarea,
    this.fecha_expiracion,
    this.fecha_recordatorio,
    this.descripcion,
    this.realizada,
    this.id_profesor,
  });
  factory tareaModel.fromMap(Map<String, dynamic> map) {
    return tareaModel(
      idTarea: map['idTarea'],
      tarea: map['tarea'],
      fecha_expiracion: map['fecha_expiracion'],
      fecha_recordatorio: map['fecha_recordatorio'],
      descripcion: map['descripcion'],
      realizada: map['realizada'],
      id_profesor: map['id_profesor'],
    );
  }
}
