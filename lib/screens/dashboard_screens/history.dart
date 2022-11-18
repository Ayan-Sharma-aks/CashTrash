import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth101/widgets/order_history_card.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class PickUpHistory extends StatefulWidget {
  const PickUpHistory({super.key});

  @override
  State<PickUpHistory> createState() => _PickUpHistoryState();
}

class _PickUpHistoryState extends State<PickUpHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('orders')
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot orderData = snapshot.data!.docs[index];
                  return OrderHistoryCard(
                      orderData: orderData,
                      orderId: orderData['orderId'],
                      date: orderData['date'],
                      items: orderData['order'],
                      status: orderData['status']);
                },
              )
            : const Center(child: CircularProgressIndicator());
      },
    ));
  }
}
