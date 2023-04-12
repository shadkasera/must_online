import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Timetables extends StatelessWidget {
  const Timetables({super.key});

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
        actions:  const [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Icon(
              Icons.search,
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
              leading: const Icon(Icons.logout,),
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

               

              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
