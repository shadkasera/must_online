import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:must_online/pages/home_screen2.dart';
import 'package:must_online/pages/show_lecturer.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
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
        title: const Text('MUST TIMETABLE'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(
                () {
                  _isSearching = !_isSearching;
                },
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green,
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
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _isSearching ? buildSearchBar() : Container(),
              const SizedBox(height: 20),
              RichText(
                text: const TextSpan(
                  text: 'WELCOME! \n\n',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'MUST timetables have been put in different categories of view. You can view a timetable by room, Lecturer or class. Proceed to view your preffered timetable by the type from the buttons below.',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    'View Lecturer\'s Timetables',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShowLecturer(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    'View Classroom Timetables',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen2(),
                      ),
                    );
                  },
                ),
              ),

              //another

              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    'View Program Timetables',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen2(),
                      ),
                    );
                  },
                ),
              ),

              //another

              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    'Search for free rooms',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const HomeScreen2(),
                    //   ),
                    // );
                    setState(
                      () {
                        _isSearching = !_isSearching;
                      },
                    );
                  },
                ),
              ),

              //another
              //another
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return Material(
      elevation: 1.0,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: 20,
                  ),
                  border: InputBorder.none,
                ),
                onSubmitted: (value) {
                  setState(() {
                    _isSearching = false;
                  });
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                setState(
                  () {
                    _isSearching = false;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
