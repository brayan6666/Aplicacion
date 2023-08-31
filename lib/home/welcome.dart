import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 46, 120, 248),
      body: Center(
        child: Text(
          "Bienvenidos",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
