import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:must_online/pages/add_class.dart';

import '../models/class.dart';

class ShowProgram extends StatefulWidget {
  const ShowProgram({super.key});

  @override
  State<ShowProgram> createState() => ShowProgramState();
}

class ShowProgramState extends State<ShowProgram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
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
      backgroundColor: Colors.grey[500],
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                      child: ListTile(
                        tileColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.black, width: 0.1),
                            borderRadius: BorderRadius.circular(10)),
                        leading: Column(
                          children: [
                            Text(
                              klasses[index].day,
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                              klasses[index].time,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        trailing: Text(
                          klasses[index].lecturer,
                          style: const TextStyle(fontSize: 20),
                        ),
                        title: Text(
                          klasses[index].room,
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              klasses[index].name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              klasses[index].module,
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
