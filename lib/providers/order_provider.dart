import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderProvider extends ChangeNotifier {
  static bool loading = false;
  void addOrder({
    required TextEditingController pincode,
    required TextEditingController address,
    required TextEditingController landmark,
    required List<String> items,
    required BuildContext context,
  }) async {
    if (pincode.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pincode Field is Empty'),
        ),
      );
    } else if (pincode.text.length > 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter Valid Pincode'),
        ),
      );
    } else if (address.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Address field is Empty'),
        ),
      );
    } else if (landmark.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter nearby landmark'),
        ),
      );
    } else if (items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select items for pickup'),
        ),
      );
    } else {
      try {
        loading = true;
        notifyListeners();

        final DateTime now = DateTime.now();
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        final String dateNow = formatter.format(now);
        String timeNow = DateFormat.Hms().format(now);

        final userId = FirebaseAuth.instance.currentUser!.uid;
        final order = FirebaseFirestore.instance.collection('order').doc();
        final data = {
          'uid': userId,
          'orderId': order.id,
          'pincode': pincode.text,
          'address': address.text,
          'landmark': landmark.text,
          'order': items,
          'date': dateNow,
          'time': timeNow,
          'status': 'pending'
        };

        order.set(data);

        FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('orders')
            .doc()
            .set(
              (data),
            )
            .then((value) {
          loading = false;
          notifyListeners();
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pickup Request Generated Successfully',
                        style: GoogleFonts.lato(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[600],
                          ),
                          child: const Text('OK'))
                    ],
                  ),
                );
              }).then(
            (value) => Navigator.popUntil(context, (route) => route.isFirst),
          );
        });
      } catch (e) {
        loading = false;
        notifyListeners();
        print(e);
      }
    }
  }
}
