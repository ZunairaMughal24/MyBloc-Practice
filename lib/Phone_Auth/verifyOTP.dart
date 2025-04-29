import "package:firebase_bloc/Phone_Auth/cubit/Auth_Cubit.dart";
import "package:firebase_bloc/Phone_Auth/cubit/Auth_States.dart";
import "package:firebase_bloc/Phone_Auth/vHome.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

// ignore: must_be_immutable
class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 11, 71, 95),
        title: const Text(
          "Verify OTP",
          style: TextStyle(fontSize: 19, color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              TextField(
                controller: otpController,
                onChanged: (value) {},
                decoration: const InputDecoration(
                    hintText: "6-digit OTP",
                    hintStyle: TextStyle(fontSize: 17),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 11, 71, 95),
                        ))),
              ),
              const SizedBox(height: 10),
              BlocConsumer<AuthCubit, AuthStates>(
                listener: (context, state) {
                  if (state is LoggedInState) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const VhomeScreen()));
                  } else if (state is ErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.error),
                      duration: const Duration(milliseconds: 2500),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<AuthCubit>(context).verifyOtp(otpController.text);
                    },
                    child: Container(
                      height: 55,
                      width: 250,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 11, 71, 95), borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                        child: Text(
                          "Sign In",
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
