import 'package:flutter/material.dart';

import '../constraints.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      'Login to ',
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
                    Form(
                        child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            labelText: 'Email',
                            fillColor: Colors.white,
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ))
                  ]))),
    );
  }
}
