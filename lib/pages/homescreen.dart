import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                //another field

                //another field
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: const Color(0xff697692),
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: GestureDetector(
                //       onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => const Timetables(),
                //             ),
                //           );
                //       },
                //       child: const Padding(
                //         padding:
                //             EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                //         child: Center(
                //           child: Text(
                //             'VIEW ROOM TIMETABLES',
                //             style: TextStyle(fontSize: 20, color: Colors.white),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                // //register

                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: const Color(0xff697692),
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: GestureDetector(
                //       onTap: () {
                //         //   Navigator.push(
                //         //     context,
                //         //     MaterialPageRoute(
                //         //       builder: (context) => const HomeScreen(),
                //         //     ),
                //         //   );
                //       },
                //       child: const Padding(
                //         padding:
                //             EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                //         child: Center(
                //           child: Text(
                //             'VIEW LECTURERS TIMETABLES',
                //             style: TextStyle(fontSize: 20, color: Colors.white),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
