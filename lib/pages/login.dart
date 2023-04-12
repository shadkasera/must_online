import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isObscure = true; // initial password field is obscured
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc0dbe9),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                        padding:  const EdgeInsets.only(left: 20),
                        child: TextField(
                          cursorColor: Colors.white,
                          controller: passwordController,
                          obscureText:
                              _isObscure, // toggle this on button press
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure =
                                      !_isObscure; // toggle the state on button press
                                });
                              },
                              icon: Icon(_isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ),
                ),

                //another field

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () => login(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.lock,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //another field
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'New?',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '  create account',
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ],
                ),
                //register
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future login(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('No user found for that email.'),
            duration: Duration(seconds: 2),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Wrong password provided for that user.'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Please check your input'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
}
