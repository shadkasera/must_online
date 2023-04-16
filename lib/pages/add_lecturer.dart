import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:must_online/models/lecturer.dart';

class AddLecturer extends StatefulWidget {
  const AddLecturer({super.key});

  @override
  State<AddLecturer> createState() => _AddLecturerState();
}

class _AddLecturerState extends State<AddLecturer> {
  String name = '';
  String room = '';
  String module = '';
  String klass = '';
  String time = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Lecturer'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Lecturer  Name',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  setState(() {
                    room = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Room',
                ),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    module = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Lecturer module',
                ),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    klass = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Lecturer class',
                ),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    time = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Lecturer time',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue[400],
                ),
                onPressed: () {
                  createLecturer(context: context);
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future createLecturer({required BuildContext context}) async {
    final docLecturer =
        FirebaseFirestore.instance.collection('lecturers').doc();

    try {
      final lecturer = Lecturer(
          id: docLecturer.id,
          name: name,
          room: room,
          module: module,
          klass: klass,
          time: time);
      final json = lecturer.toJson();

      await docLecturer.set(json);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Lecturer Added Successfully',
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 5),
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error $e'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }
}
