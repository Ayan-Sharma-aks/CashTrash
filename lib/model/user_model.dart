import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserMode {
  final String uid;
  final String name;
  final String email;
  final String password;
  final String phone;
  final HashMap order;
  UserMode({
    required this.uid,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.order,
  });

  factory UserMode.fromDocument(DocumentSnapshot doc) {
    return UserMode(
        uid: doc['uid'],
        name: doc['name'],
        email: doc['email'],
        password: doc['password'],
        phone: doc['phone_number'],
        order: doc['order']);
  }
}

late UserMode userModel;

Future getCurrentUserData() async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then(
    (DocumentSnapshot doc) {
      if (doc.exists) {
        userModel = UserMode.fromDocument(doc);
      } else {
        print('Document does not exist');
      }
    },
  );
}
