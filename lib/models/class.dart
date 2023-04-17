import 'dart:convert';

class Klass {
  String id;
  String name;
  String room;
  String lecturer;
  String module;
  String day;
  String time;
  



  Klass({required this.id, required this.name, required this.lecturer, required this.module,  required this.time, required this.room, required this.day});

  factory Klass.fromJson(Map<String, dynamic> json) {
    return Klass(
      id: json['id'],
      name: json['name'],
      room: json['room'],
      lecturer: json['lecturer'],
      module: json['module'],
      day: json['day'],
      time: json['time'],

     
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'room': room,
      'lecturer': lecturer,
      'module': module,
      'day': day,
      'time': time,
      
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  static Klass fromJsonString(String jsonString) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return Klass.fromJson(jsonMap);
  }
}
