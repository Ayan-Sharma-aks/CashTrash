import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String password;
  final String phone;
  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      uid: doc['uid'],
      name: doc['name'],
      email: doc['email'],
      password: doc['password'],
      phone: doc['phone_number'],
    );
  }
}

late UserModel userModel;

Future getCurrentUserData() async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then(
    (DocumentSnapshot doc) {
      if (doc.exists) {
        userModel = UserModel.fromDocument(doc);
      } else {
        print('Document does not exist');
      }
    },
  );
}
