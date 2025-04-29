import "package:firebase_bloc/Phone_Auth/cubit/Auth_Cubit.dart";
import "package:firebase_bloc/Phone_Auth/cubit/Auth_States.dart";
import "package:firebase_bloc/Phone_Auth/verifyOTP.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VerifyNum(),
    );
  }
}

// ignore: must_be_immutable
class VerifyNum extends StatelessWidget {
  VerifyNum({super.key});
  TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 71, 95),
        title: const Center(
            child: Text(
          "Verify Number",
          style: TextStyle(fontSize: 19, color: Colors.white),
        )),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: numberController,
                onChanged: (value) {},
                decoration: InputDecoration(
                    hintText: "Enter your number",
                    hintStyle: const TextStyle(fontSize: 17),
                    border: OutlineInputBorder(
                      // Add border to the TextField
                      borderRadius: BorderRadius.circular(10.0), // Set the border radius
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 11, 71, 95),
                      ),
                    )),
              ),
              const SizedBox(height: 10),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen()));
              //   },
              BlocConsumer<AuthCubit, AuthStates>(
                listener: (context, state) {
                  if (state is CodeSentState) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen()));
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return GestureDetector(
                    onTap: () {
                      String phoneNumber = "+92${numberController.text}";
                      BlocProvider.of<AuthCubit>(context).sendOtp(phoneNumber);
                    },
                    child: Container(
                      height: 55,
                      width: 250,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 11, 71, 95), borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                        child: Text(
                          "Send OTP",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
