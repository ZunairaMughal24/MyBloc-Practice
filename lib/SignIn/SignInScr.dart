import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'SignInBloc/Events.dart';
import 'SignInBloc/bloc.dart';
import 'SignInBloc/states.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 52, 88),
        title: const Text("Sign In",
            style: TextStyle(fontSize: 22, color: Colors.white, decoration: TextDecoration.none),
            textAlign: TextAlign.center),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            BlocBuilder<SignInBloc, SignInStates>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.eroorMessage,
                    style: const TextStyle(fontSize: 17, color: Colors.red, decoration: TextDecoration.none),
                  );
                } else {
                  return Container();
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context)
                      .add(SignInTextChangedEvent(emailController.text, passwordController.text));
                },
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: "Email", border: OutlineInputBorder(), hintStyle: TextStyle(fontSize: 17)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                //The onChanged callback is called whenever the text in the field changes.
                //In this code, it triggers a function that sends
                //a SignInTextChangedEvent to the SignInBloc using BlocProvider.of<SignInBloc>(context).add(...).
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context)
                      //Even though the password field is being updated,
                      //the SignInTextChangedEvent represents a change in the entire sign-in form.
                      //By including both the email and password values in the event,
                      //we ensure that the BLoC has access to all the relevant information about the form's state.
                      .add(SignInTextChangedEvent(emailController.text, passwordController.text));
                },
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: "Password", border: OutlineInputBorder(), hintStyle: TextStyle(fontSize: 17)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<SignInBloc, SignInStates>(
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return GestureDetector(
                    onTap: () {
                      if (state is SignInValidState) {
                        BlocProvider.of<SignInBloc>(context)
                            .add(SignInSubmitEvent(emailController.text, passwordController.text));
                      }
                    },
                    child: Container(
                      height: 55,
                      width: 200,
                      decoration: BoxDecoration(
                        color: (state is SignInValidState) ? const Color.fromARGB(255, 21, 52, 88) : Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text("Submit ",
                            style: TextStyle(fontSize: 17, color: Colors.white, decoration: TextDecoration.none),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
