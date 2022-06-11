import 'dart:developer';

import 'package:etherwall/widget/bottomNavBar.dart';
import 'package:flutter/material.dart';

import '../constraints.dart';

GlobalKey<FormState> formKey = GlobalKey();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 233, 248),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome back',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.network(
                        logoadr,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '',
                        style: TextStyle(fontSize: 40, color: Colors.black),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                          child: Form(
                              key: formKey,
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter yout email';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      prefixIcon: Icon(Icons.email,
                                          color: Colors.black),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      labelText: 'Email',
                                      hintText: 'someone@example.com',
                                      labelStyle: TextStyle(
                                        // fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                    enableSuggestions: false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      if (value.length < 6) {
                                        return 'Password must be at least 6 characters';
                                      }
                                      return null;
                                    },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    autocorrect: false,
                                    decoration: const InputDecoration(
                                      suffixIcon: Icon(Icons.remove_red_eye),
                                      isDense: true,
                                      prefixIcon: Icon(Icons.email,
                                          color: Colors.black),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      labelText: 'Password',
                                      hintText: 'Password',
                                      labelStyle: TextStyle(
                                        // fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    child: const Text('Forgot your password?',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15,
                                          // fontWeight: FontWeight.normal
                                        )),
                                  ),
                                  const SizedBox(height: 150),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        Navigator.popUntil(
                                            context, (route) => route.isFirst);
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => btmNavBar(),
                                            ));
                                      } else {
                                        log('please fill out form');
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: Size(
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                            40),
                                        primary: Colors.blue,
                                        onPrimary: Colors.white),
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 20,
                                        // fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Don\'t have an account?',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          // fontWeight: FontWeight.normal
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const btmNavBar(),
                                                ));
                                          },
                                          child: const Text('Sign Up')),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      )
                    ]),
              ))),
    );
  }
}
