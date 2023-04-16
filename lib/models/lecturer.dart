import 'dart:convert';

class Lecturer {
  String id;
  String name;
  String room;
  String module;
  String klass;
  String time;
  



  Lecturer({required this.id, required this.name, required this.module, required this.klass, required this.time, required this.room});

  factory Lecturer.fromJson(Map<String, dynamic> json) {
    return Lecturer(
      id: json['id'],
      name: json['name'],
      room: json['room'],
      module: json['module'],
      klass: json['klass'],
      time: json['time'],
     
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'room': room,
      'module': module,
      'klass': klass,
      'time': time,
      
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
