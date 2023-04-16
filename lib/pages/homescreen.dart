import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:must_online/models/lecturer.dart';

import 'add_lecturer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: const Text('MUST  TIMETABLE'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddLecturer(),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
              ),
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xffc0dbe9),
      body: SafeArea(
        child: StreamBuilder(
            stream: readLecturer(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final lecturers = snapshot.data!;
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: lecturers.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: Key(lecturers[index].id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        child: const Icon(
                          Icons.delete_forever,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                      // onDismissed: (direction) {
                      //   deleteSchool(
                      //               context: context, school: lecturers[index]);

                      // },
                      child: ListTile(
                        leading: Text(
                          lecturers[index].room,
                          style: const TextStyle(fontSize: 20),
                        ),
                        trailing: Text(
                          lecturers[index].time,
                          style: const TextStyle(fontSize: 20),
                        ),
                        title: Text(
                          lecturers[index].name,
                          style: const TextStyle(fontSize: 24),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lecturers[index].module,
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              lecturers[index].klass,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('$snapshot.error');
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }

  Stream<List<Lecturer>> readLecturer() =>
      FirebaseFirestore.instance.collection('lecturers').snapshots().map(
            (snapshot) => snapshot.docs
                .map(
                  (doc) => Lecturer.fromJson(
                    doc.data(),
                  ),
                )
                .toList(),
          );
}
