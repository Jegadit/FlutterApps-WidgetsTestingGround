// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:my_new_chat_app/user_screen.dart';

import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String verId;
  late String phone;
  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            codeSent
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(height: size.height / 3.5),
                        const Text(
                          'Enter the OTP sent to your mobile number',
                          style: TextStyle(
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
                      ],
                    ),
                  )
                : Column(
                    children: [
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
                          },
                          child: const Text("Sign-In"),
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
                            //createAcc();
                          },
                          child: const Text("Sign-Up"),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  void verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          final snackBar = SnackBar(content: Text("Login Success"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const UserScreen()));
        },
        verificationFailed: (FirebaseAuthException e) {
          final snackBar = SnackBar(content: Text("${e.message}"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        codeSent: (String verficationId, int? resendToken) {
          setState(() {
            codeSent = true;
            verId = verficationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            verId = verificationId;
          });
        },
        timeout: const Duration(seconds: 60));
  }

  void verifyPin(String pin) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: pin);

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      final snackBar = SnackBar(content: Text("Login Success"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(context, MaterialPageRoute(builder: (_) => UserScreen()));
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(content: Text("${e.message}"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

// keytool -list -v -keystore "C:\Users\Jegadit\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android