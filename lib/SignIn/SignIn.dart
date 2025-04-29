import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignIn(),
    );
  }
}

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        children: [
          const Text("Welcome ",
              style: TextStyle(fontSize: 25, color: Colors.blue, decoration: TextDecoration.none),
              textAlign: TextAlign.center),
          Container(
            height: 45,
            width: 200,
            color: Colors.blue,
            child: const Text("Sign In ",
                style: TextStyle(fontSize: 17, color: Colors.white, decoration: TextDecoration.none),
                textAlign: TextAlign.center),
          ),
          Container(
            height: 45,
            width: 200,
            color: Colors.blue,
            child: const Text("Make an account ",
                style: TextStyle(fontSize: 17, color: Colors.white, decoration: TextDecoration.none),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
