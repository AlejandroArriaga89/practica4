class carreraModel {
  int? id_carrera;
  String? carrera;

  carreraModel({this.id_carrera, this.carrera});
  factory carreraModel.fromMap(Map<String, dynamic> map) {
    return carreraModel(id_carrera: map['id_carrera'], carrera: map['carrera']);
  }
}
