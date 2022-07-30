import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerifyPhoneV3 extends StatefulWidget {
  const VerifyPhoneV3({Key? key, this.number, this.verid}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final number;
  final verid;

  @override
  // ignore: no_logic_in_create_state
  _VerifyPhoneV3State createState() => _VerifyPhoneV3State(number, verid);
}

class _VerifyPhoneV3State extends State<VerifyPhoneV3> {
  // ignore: prefer_typing_uninitialized_variables
  final phoneNumber;
  // ignore: prefer_typing_uninitialized_variables
  var _verificationId;
  bool codeSent = false;

  _VerifyPhoneV3State(this.phoneNumber, this._verificationId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.number),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 30,
              style: const TextStyle(fontSize: 20),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                verifyPin(pin);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  //verifyPhone();
                },
                child: const Text("Verify"))
          ],
        ),
      ),
    );
  }

  Future<void> verifyPin(String pin) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: pin);

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      final snackBar = SnackBar(content: Text("Login Success"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(content: Text("${e.message}"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
