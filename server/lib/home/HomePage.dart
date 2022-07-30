import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -size.height * 0.15,
            right: -size.height * 0.20,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: size.height * 0.5,
              width: size.height * 0.5,
              decoration: const BoxDecoration(
                color: Color.fromARGB(233, 169, 107, 0),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -size.height * 0.15,
            left: -size.height * 0.20,
            child: Row(),
          ),
          Positioned(
            top: size.height / 4.5,
            right: 0,
            left: size.height / 42,
            child: const Text("YIDHRA",
                style: TextStyle(
                    fontSize: 60,
                    fontFamily: 'Comfortaa',
                    letterSpacing: 15,
                    color: Colors.white)),
          ),
          /*
          Positioned(
            top: size.height / 4.5,
            right: 0,
            left: size.height / 42,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                ),
              ),
              child: const Image(
                image: AssetImage('assets/images/thinkpad.png'),
              ),
            ),
          ),
           */
        ],
      ),
    );
  }
}
