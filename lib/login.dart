import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoho/contact.dart';
import 'package:zoho/register.dart';
import 'package:zoho/services/authentication_service.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController? controllerEmail = TextEditingController();
  TextEditingController? controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _user = context.watch<User?>();

    if (_user != null) {
      return MyContact();
    }

    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'Sign In',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.only(bottom: 250)),
                        Text("Don't have an account? "),
                        TextButton(
                          child: const Text('Sign Up'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyRegister()));
                          },
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 30),
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Email'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: controllerEmail,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Password'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: controllerPassword,
                            style: TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot your password?',
                                    style: TextStyle(
                                        color: Colors.lightBlue,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          MaterialButton(
                            //sign in button
                            onPressed: () async {
                              await context
                                  .read<AuthenticationService>()
                                  .signIn(
                                      email: controllerEmail?.text,
                                      password: controllerPassword?.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyContact()));
                            },
                            color: Colors.lightBlue,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 110,
                                  ),
                                  Text(
                                    'Sign In',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
