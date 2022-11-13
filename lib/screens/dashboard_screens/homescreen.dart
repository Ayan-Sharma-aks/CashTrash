import 'package:firebase_auth101/widgets/check_pincode.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.network(
              'https://assets8.lottiefiles.com/packages/lf20_tja8xM0Y9R.json'),
        ),
        ElevatedButton(
            onPressed: () {
              try {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CheckPincode();
                    });
              } catch (e) {}
            },
            child: Text('Check Pincode Avaibility'))
      ],
    );
  }
}
