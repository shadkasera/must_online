import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text('Must Schools'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.settings,
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xffc0dbe9),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //another field

              const Text('Signed In As'),
              const SizedBox(height: 12),
              Text(user.email!),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ElevatedButton(
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.logout,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff697692),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const HomeScreen(),
                      //     ),
                      //   );
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                      child: Text(
                        'Malawi Institute of Technology',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff697692),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const HomeScreen(),
                      //     ),
                      //   );
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                      child: Text(
                        'Ndata School of Climate and Earth Sciences',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              //another field
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff697692),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const HomeScreen(),
                      //     ),
                      //   );
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                      child: Text(
                        'Acadamy of Medical sciences',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),

              //register

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff697692),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const HomeScreen(),
                      //     ),
                      //   );
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                      child: Text(
                        'Bingu School of Culture and Heritage',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
