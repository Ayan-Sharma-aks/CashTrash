import 'package:firebase_auth101/constant/constants.dart';
import 'package:firebase_auth101/widgets/customized_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_textfield.dart';

class PickUpRequest extends StatelessWidget {
  PickUpRequest({super.key});

  final TextEditingController _pincode_Controller = TextEditingController();
  final TextEditingController _AddressLine_1_Controller =
      TextEditingController();
  final TextEditingController _AddressLine_2_Controller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.green.shade900, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_sharp),
                        onPressed: () {
                          Navigator.pop(context);
                          // Navigator.of(context).popUntil((route) => route.isFirst);
                          // Navigator.popAndPushNamed(context, '/dashboard');
                        }),
                  ),
                  SizedBox(
                    width: Constants.width(context, 12),
                  ),
                  Text(
                    'Request PickUp',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Pincode',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                myController: _pincode_Controller,
                hintText: 'Enter valid Pincode',
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              const Text(
                'Address',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                myController: _pincode_Controller,
                hintText: 'Enter your Address',
                inputType: TextInputType.streetAddress,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      )),
    );
  }
}
