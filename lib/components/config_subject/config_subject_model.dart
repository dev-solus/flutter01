class ConfigSubject {
  int id;
  String titre;
  String? description;
  String? imagePath;
  String? videoPath;
  // DateTime creationDate;
  int createdById;
  // DateTime updatedDate;
  int updatedById;
  int classId;

  ConfigSubject({
    required this.id,
    required this.titre,
    required this.description,
    required this.imagePath,
    required this.videoPath,
    // required this.creationDate,
    required this.createdById,
    // required this.updatedDate,
    required this.updatedById,
    required this.classId,
  });

  factory ConfigSubject.fromJson(Map<String, dynamic> json) {
    return ConfigSubject(
      id: json['id'],
      titre: json['titre'],
      description: json['description'],
      imagePath: json['imagePath'],
      videoPath: json['videoPath'],
      // creationDate: json['creationDate'],
      createdById: json['createdById'],
      // updatedDate: json['updatedDate'],
      updatedById: json['updatedById'],
      classId: json['classId'],
    );
  }
}
