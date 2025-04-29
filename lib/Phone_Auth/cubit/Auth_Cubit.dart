import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_bloc/Phone_Auth/cubit/Auth_States.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCubit() : super(InitialState());
  String? _verificationId;

  void sendOtp(String phoneNum) async {
    emit(LoadingState());
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNum,
      codeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        emit(CodeSentState());
      },
      verificationCompleted: (phoneAuthCredential) {
        signInWithPhone(phoneAuthCredential);
      },
      verificationFailed: (error) {
        emit(ErrorState(error.toString()));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  void verifyOtp(String otp) async {
    emit(LoadingState());
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: _verificationId.toString(), smsCode: otp);
    signInWithPhone(credential);
    print(_verificationId);
  }

  void signInWithPhone(PhoneAuthCredential credential) async {
    try {
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        emit(LoggedInState(userCredential.user!));
      }
    } on FirebaseAuthException catch (ex) {
      emit(ErrorState(ex.message.toString()));
    }
  }
}
