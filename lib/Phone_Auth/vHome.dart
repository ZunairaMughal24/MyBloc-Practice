import "package:flutter/material.dart";

class VhomeScreen extends StatelessWidget {
  const VhomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 11, 71, 95),
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          height: 55,
          width: 250,
          decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 11, 71, 95),
              ),
              borderRadius: BorderRadius.circular(15)),
          child: const Center(
            child: Text(
              " Log Out",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 11, 71, 95),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
