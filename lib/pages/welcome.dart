import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  bool _isSearching = false;
  bool _showButtons = false;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
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
              setState(() {
                _isSearching = !_isSearching;
              });
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
      body: Column(children: [
        _isSearching ? buildSearchBar() : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showButtons = !_showButtons;
                });
              },
              child: const Text('MON'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showButtons = !_showButtons;
                });
              },
              child: const Text('MON'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showButtons = !_showButtons;
                });
              },
              child: const Text('MON'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showButtons = !_showButtons;
                });
              },
              child: const Text('MON'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showButtons = !_showButtons;
                });
              },
              child: const Text('MON'),
            ),
          ],
        ),
        _showButtons
            ? Column(
                children: [
                  ElevatedButton(
                    child: const Text('Sub-Button 1'),
                    onPressed: () {
                      
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Sub-Button 2'),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: const Text('Sub-Button 3'),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: const Text('Sub-Button 3'),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: const Text('Sub-Button 3'),
                    onPressed: () {},
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ]),
    );
  }

  Widget buildSearchBar() {
    return Material(
      elevation: 4.0,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search',
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
                setState(() {
                  _isSearching = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
