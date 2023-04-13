import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:must_online/models/school.dart';
import 'package:must_online/pages/timetables.dart';

import 'add_school.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
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
                    builder: (context) => const AddSchool(),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ),
                    Text(
                      user.email!,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Update the UI
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text('Log out'),
              onTap: () {
                // Update the UI
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: readSchools(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final schools = snapshot.data!;
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: schools.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                       leading: const Icon(Icons.school),
                      title: Text(schools[index].name),
                      subtitle:  Text(schools[index].location),
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

  Stream<List<School>> readSchools() => FirebaseFirestore.instance
      .collection('schools')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => School.fromJson(
                doc.data(),
              ))
          .toList());
}
