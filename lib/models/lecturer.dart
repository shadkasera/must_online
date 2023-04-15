import 'dart:convert';

class Lecturer {
  String id;
  String name;
  String module;
  String klass;



  Lecturer({required this.id, required this.name, required this.module, required this.klass});

  factory Lecturer.fromJson(Map<String, dynamic> json) {
    return Lecturer(
      id: json['id'],
      name: json['name'],
      module: json['module'],
      klass: json['klass'],
     
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'module': module,
      'klass': klass,
      
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  static Lecturer fromJsonString(String jsonString) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return Lecturer.fromJson(jsonMap);
  }
}
