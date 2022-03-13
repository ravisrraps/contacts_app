import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoho/models/contacts.dart';
import 'package:zoho/models/user.dart';
import 'package:zoho/register.dart';
import 'package:zoho/login.dart';
import 'package:zoho/services/download_service.dart';
import 'package:zoho/services/upload_service.dart';

class MyContact extends StatefulWidget {
  const MyContact({Key? key}) : super(key: key);

  @override
  State<MyContact> createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {
  TextEditingController? controllerName = TextEditingController();
  TextEditingController? controllerPhone = TextEditingController();
  TextEditingController? controllerEmail = TextEditingController();
  List<Contact> _contacts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<DownloadService>()
        .fetchData()
        .then((value) => _contacts = value);
  }

  List<TableRow> getRows() {
    List<TableRow> _rows = [];
    _rows.add(TableRow(
      children: [
        _tableCell("Name"),
        _tableCell("Phone"),
        _tableCell("Email"),
      ],
    ));
    for (int i = 0; i < _contacts.length; i++) {
      _rows.add(TableRow(
        children: [
          _tableCell(_contacts[i].getName()),
          _tableCell(_contacts[i].getPhone()),
          _tableCell(_contacts[i].getEmail()),
        ],
      ));
    }

    return _rows;
  }

  Widget _tableCell(String? name) {
    return Center(
      child: Text(name!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(bottom: 0),
            child: const Text(
              'Contact Form and Contact List Page',
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
                  top: MediaQuery.of(context).size.height * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(padding: EdgeInsets.only(bottom: 150)),
                      Text(
                        "Add Contacts",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Name'),
                        ),
                        TextField(
                          controller: controllerName,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Ph No'),
                        ),
                        TextField(
                          controller: controllerPhone,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Email'),
                        ),
                        TextField(
                          controller: controllerEmail,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          //sign in button
                          onPressed: () async {
                            context
                                .read<Contact>()
                                .setName(controllerName?.text);
                            context
                                .read<Contact>()
                                .setPhone(controllerPhone?.text);
                            context
                                .read<Contact>()
                                .setEmail(controllerEmail?.text);
                            await context
                                .read<UploadService>()
                                .uploadContacts(context);
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Save',
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Table(
                          children: getRows(),
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
    );
  }
}
