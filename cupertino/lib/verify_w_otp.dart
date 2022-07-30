import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerifyWOtp extends StatelessWidget {
  const VerifyWOtp({Key? key, this.number}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final number;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: size.height / 3.5),
                Text(
                  'Enter the OTP sent to $number',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height / 15),
                OTPTextField(
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 30,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onCompleted: (pin) {
                    verifyPin(pin);
                  },
                ),
                const SizedBox(height: 150),
                // ignore: sized_box_for_whitespace
                Container(
                  height: size.height / 15,
                  width: size.width / 1.2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo[400],
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Verify"),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  void verifyPin(String pin) async {
    // ignore: avoid_print
    //print(number + " Final version");

    FirebaseAuth _auth = FirebaseAuth.instance;
    //_auth.verifyPhoneNumber(phoneNumber: phoneNumber, verificationCompleted: verificationCompleted, verificationFailed: verificationFailed, codeSent: codeSent, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
  }
}
