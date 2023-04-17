import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:must_online/models/lecturer.dart';

import '../models/class.dart';

class AddClass extends StatefulWidget {
  const AddClass({super.key});

  @override
  State<AddClass> createState() => _AddClassState();
}

class _AddClassState extends State<AddClass> {
  String name = '';
  String room = '';
  String lecturer = '';
  String module = '';
  String day = '';
  String time = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Class'),
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
                  hintText: 'Enter Class  Name',
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
                  hintText: 'Enter  Class Room',
                ),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    module = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter the module',
                ),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    lecturer = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter Lecturer name',
                ),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    time = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter  time',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    day = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter day',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue[400],
                ),
                onPressed: () {
                  createKlass(context: context);
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future createKlass({required BuildContext context}) async {
    final docKlass = FirebaseFirestore.instance.collection('klasses').doc();

    try {
      final klass = Klass(
          id: docKlass.id,
          name: name,
          room: room,
          module: module,
          day: day,
          time: time,
          lecturer: lecturer);
      final json = klass.toJson();

      await docKlass.set(json);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Class Added Successfully',
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
