import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class liquidswipe extends StatelessWidget {
  //const liquidswipe({ Key? key }) : super(key: key);
  final page = [
    Container(
        color: const Color(0xffe63946),
        child: Column(
          children: [
            Image.asset("images/___logo_final-removebg.png"),
            const Text("Welcome",
                style: TextStyle(fontSize: 40, color: Colors.white)),
            const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        )),
    Container(color: const Color(0xfff1faee)),
    Container(color: const Color(0xffa8dadc)),
    Container(color: const Color(0xff457b9d)),
    Container(color: const Color(0xfff1d3557))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LiquidSwipe(
      pages: page,
      enableSideReveal: true,
    ));
  }
}
