import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc0dbe9),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 20.0,
                  ),
                ),
                child: Image.asset(
                  'assets/images/must_logo1.png',
                  height: 50,
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Text(
                  'MUST ONLINE',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              //picture of the app
              const SizedBox(
                height: 20,
              ),

              //name field
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 25,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff697692),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: emailController,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'name',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //
              //password text field

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 25,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff697692),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: emailController,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'email',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // another field
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 25,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff697692),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      cursorColor: Colors.white,
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //another field

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.add,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Create account',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              

              //register
            ],
          ),
        ),
      ),
    );
  }
}
