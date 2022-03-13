import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoho/login.dart';
import 'package:zoho/services/authentication_service.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  TextEditingController? controllerEmail = TextEditingController();
  TextEditingController? controllerPassword = TextEditingController();
  TextEditingController? controllerSecret = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(bottom: 0),
              child: Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ),
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
                        Padding(padding: EdgeInsets.only(bottom: 150)),
                        Text("Already have an account? "),
                        TextButton(
                          child: const Text('Sign In'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const MyLogin()));
                          },
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Email'),
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
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Password'),
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
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Secret'),
                          ),
                          TextField(
                            controller: controllerSecret,
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
                            height: 9,
                          ),
                          MaterialButton(
                            //sign in button
                            onPressed: () async {
                              await context
                                  .read<AuthenticationService>()
                                  .signUp(
                                    email: controllerEmail?.text,
                                    password: controllerPassword?.text,
                                  );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyLogin()));
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
                                    'Sign Up',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "By clicking the 'Sign Up' button,you are creating an\naccount,and you agree to the Terms of Use",
                            style: TextStyle(fontSize: 12),
                          )
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
