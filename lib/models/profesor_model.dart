class profesorModel {
  int? id_profesor;
  String? profesor;
  String? email;
  int? id_carrera;

  profesorModel({
    this.id_profesor,
    this.profesor,
    this.email,
    this.id_carrera,
  });
  factory profesorModel.fromMap(Map<String, dynamic> map) {
    return profesorModel(
      id_profesor: map['id_profesor'],
      profesor: map['profesor'],
      email: map['email'],
      id_carrera: map['id_carrera'],
    );
  }
}
