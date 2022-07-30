//import 'package:cupertino/verify_number.dart';
import 'package:cupertino/new_phoneverifyv3.dart';
import 'package:cupertino/verify_w_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//import 'package:cupertino/main_chat_page.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String phone;
  late String verId;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height / 6,
            ),

            // ignore: sized_box_for_whitespace
            Container(
              width: size.width / 1.15,
              child: const Text("Hello \nThere.",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 80,
                      height: 0.9,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            SizedBox(
              height: size.height / 40,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: size.width / 1.2,
              child: const Text("Sign in to continue...",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45)),
            ),
            SizedBox(
              height: size.height / 15,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: IntlPhoneField(
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phonenumber) {
                    setState(() {
                      phone = phonenumber.completeNumber;
                    });
                  }),
            ),
            const SizedBox(height: 10),
            // ignore: sized_box_for_whitespace
            Container(
              height: size.height / 15,
              width: size.width / 1.2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  verifyPhone();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => VerifyPhoneV3(number: phone, verid: verId)));
                },
                child: const Text("Log-In"),
              ),
            ),
            const SizedBox(height: 30),
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
                onPressed: () {
                  // ignore: avoid_print
                  print(phone);
                },
                child: const Text("Sign-Up"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          final snackBar = SnackBar(content: Text("Login Success"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        verificationFailed: (FirebaseAuthException e) {
          final snackBar = SnackBar(content: Text("${e.message}"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        codeSent: (String verficationId, int? resendToken) {
          setState(() {
            //codeSent = true;
            verId = verficationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            verId = verificationId;
          });
        },
        timeout: Duration(seconds: 60));
  }
}
