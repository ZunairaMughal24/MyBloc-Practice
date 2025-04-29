import "package:firebase_bloc/Connectivity/Cubit/Internet_cubit.dart";
import "package:flutter/material.dart";

import "package:flutter_bloc/flutter_bloc.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 228, 228, 228),
          child: Center(
            child: BlocConsumer<InternetCubit, InternetStates>(
              listener: (context, state) {
                if (state == InternetStates.gained) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "connected",
                      style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),
                    ),
                    backgroundColor: Colors.green,
                  )); // TODO: implement listener
                } else if (state == InternetStates.lost) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "not connected",
                      style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),
                    ),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              builder: (context, state) {
                return BlocBuilder<InternetCubit, InternetStates>(
                  builder: (context, state) {
                    if (state == InternetStates.gained) {
                      return const Text(
                        "connected",
                        style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),
                      );
                    } else if (state == InternetStates.lost) {
                      return const Text(
                        "Not connected",
                        style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),
                      );
                    }
                    return const Text(
                      "loading....",
                      style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
