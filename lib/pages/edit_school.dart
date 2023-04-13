import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:must_online/models/school.dart';

class EditSchool extends StatefulWidget {
  final School school;
  const EditSchool({super.key, required this.school});

  @override
  State<EditSchool> createState() => _EditSchoolState();
}

class _EditSchoolState extends State<EditSchool> {
  String name = '';
  String location = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.school.name),
        centerTitle: true,
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
                decoration: InputDecoration(
                  hintText: widget.school.name,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  setState(() {
                    location = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: widget.school.location,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue[400],
                ),
                onPressed: () {
                  updateSchool(context: context, school: widget.school);
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future updateSchool({required BuildContext context, required School school}) async {
    final docSchool = FirebaseFirestore.instance.collection('schools').doc(school.id);

    try {
      final school = School(id: docSchool.id, name: name, location: location);
      final json = school.toJson();

      await docSchool.update(json);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'School Updated Successfully',
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
