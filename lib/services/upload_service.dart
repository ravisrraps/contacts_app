import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zoho/models/contacts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart' as my;

/*
This service class is used to provide upload services to the app.
The upload services mainly include uploading the info about the contacts and 
the user info such as email, password, secretkey.
*/

class UploadService {
  final FirebaseFirestore _firestoreReference = FirebaseFirestore.instance;

  UploadService(FirebaseAuth instance);

  Future<void> uploadSecretKey(BuildContext context) async {
    var _user = context.read<my.User>();

    try {
      _firestoreReference.collection("users").add({
        'email': _user.getEmail() ?? '',
        'password': _user.getPassword() ?? '',
        'secretKey': _user.getSecretKey() ?? '',
      }).then((value) => debugPrint('Secret Key Saved'));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> uploadContacts(BuildContext context) async {
    Contact _contact = context.read<Contact>();

    try {
      _firestoreReference.collection("contacts").add({
        'name': _contact.getName() ?? '',
        'phone': _contact.getPhone() ?? '',
        'email': _contact.getEmail() ?? '',
      }).then((value) => debugPrint("Contact Saved"));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
