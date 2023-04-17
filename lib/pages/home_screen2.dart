import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:must_online/models/lecturer.dart';
import 'package:must_online/pages/add_class.dart';

import '../models/class.dart';
import 'add_lecturer.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
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
                    builder: (context) => const AddClass(),
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
            stream: readKlass(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                 final klasses = snapshot.data!;
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: klasses.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: Key(klasses[index].id),
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
                      //               context: context, school: klasses[index]);

                      // },
                      child: ListTile(
                        leading: Column(
                          children: [
                            Text(
                              klasses[index].day,
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                              klasses[index].time,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        trailing: Text(
                         klasses[index].room,
                         style: const TextStyle(fontSize: 24),
                            ),
                        title: Text(
                          klasses[index].name,
                          style: const TextStyle(fontSize: 24),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              klasses[index].module,
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                              klasses[index].lecturer,
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 5,
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

  Stream<List<Klass>> readKlass() =>
      FirebaseFirestore.instance.collection('klasses').snapshots().map(
            (snapshot) => snapshot.docs
                .map(
                  (doc) => Klass.fromJson(
                    doc.data(),
                  ),
                )
                .toList(),
          );
}
