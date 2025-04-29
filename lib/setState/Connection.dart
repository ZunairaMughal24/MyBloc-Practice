import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SetStateConnectivity(),
    );
  }
}

class SetStateConnectivity extends StatefulWidget {
  const SetStateConnectivity({super.key});

  @override
  State<SetStateConnectivity> createState() => _SetStateConnectivityState();
}

class _SetStateConnectivityState extends State<SetStateConnectivity> {
  // final Connectivity _connectivity = Connectivity();
  String connectionStatus = "";
  @override
  void initState() {
    super.initState();
    checkConnectionState();
  }

  Future<void> checkConnectionState() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        connectionStatus = "Connected to Internet";
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(connectionStatus),
          backgroundColor: const Color.fromARGB(255, 177, 176, 176),
        ));
      });
    } else {
      setState(() {
        connectionStatus = "Not Connected to Internet";
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(connectionStatus),
          backgroundColor: const Color.fromARGB(255, 168, 168, 168),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Center(
            child: Text(
              connectionStatus,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
