import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
//import 'package:flutter/material.dart';

enum Status { waiting, error }

class VerifyPhone extends StatefulWidget {
  const VerifyPhone({Key? key, this.number}) : super(key: key);
  final number;

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState(number);
}

class _VerifyPhoneState extends State<VerifyPhone> {
  final phoneNumber;
  // ignore: prefer_final_fields
  var _status = Status.waiting;
  var _verificationId;

  _VerifyPhoneState(this.phoneNumber);

  @override
  void initState() {
    super.initState();
  }

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
                  'Enter the OTP sent to $phoneNumber',
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
              ],
            ),
          )
        ],
      )),
    );
  }

  void verifyPin(String pin) {
    print(phoneNumber + " Final version");
  }

  /*
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Verify Phone'),
          previousPageTitle: "Edit Phone Number",
        ),
        child: _status != Status.error
            ? Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Text("OTP Verification\n",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: const Color(0xFF08C187).withOpacity(0.7),
                              fontSize: 30,
                            ))),
                    Text("Enter the OTP sent to your phone number",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.7),
                          fontSize: 13,
                        )),
                    // ignore: prefer_if_null_operators
                    Text(phoneNumber == null ? "" : phoneNumber,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.7),
                          fontSize: 12.1,
                        )),
                    CupertinoTextField(
                      onChanged: (value) async {
                        print(value);
                        //if (value.length == 6)
                        {
                          _verificationId = value;
                        }
                      },
                      textAlign: TextAlign.center,
                      style: const TextStyle(letterSpacing: 30, fontSize: 30),
                      maxLength: 6,
                      //controller: _textEditingController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          child: const Text("Resend OTP"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            textStyle: const TextStyle(fontSize: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                        ),
                        ElevatedButton(
                          child: const Text("    Verify    "),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            textStyle: const TextStyle(fontSize: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            print(_verificationId);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Text("OTP Verification",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: const Color(0xFF08C187).withOpacity(0.7),
                            fontSize: 30,
                          ))),
                  Text("\nInvalid Code",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                        fontSize: 20,
                      )),
                  CupertinoButton(
                    child: Text("Edit Number",
                        style: TextStyle(
                          color: const Color(0xFF08C187).withOpacity(0.7),
                          fontSize: 20,
                        )),
                    onPressed: () => Navigator.pop(context),
                  ),
                  /*CupertinoButton(
                    child: Text(" Resend  Code",
                        style: TextStyle(
                          color: const Color(0xFF08C187).withOpacity(0.7),
                          fontSize: 20,
                        )),
                    onPressed: () => {},
                  ),*/
                ],
              ));
  }*/
}
