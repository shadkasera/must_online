import 'dart:convert';

class School {
  String id;
  String name;
  String location;

  School({required this.id, required this.name, required this.location});

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      id: json['id'],
      name: json['name'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  static School fromJsonString(String jsonString) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return School.fromJson(jsonMap);
  }
}
