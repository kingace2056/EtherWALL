import 'dart:developer';
import 'package:etherwall/constraints.dart';
import 'package:etherwall/screens/login.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 80, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                logoadr,
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to ',
                style: TextStyle(
                  color: Color.fromARGB(146, 255, 255, 255),
                  fontSize: 25,
                ),
              ),
              Text(
                'EtherWALL',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.45),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Create Account',
                    style: TextStyle(fontSize: 15),
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
                InkWell(
                  onTap: () {
                    log('This is message');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
