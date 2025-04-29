import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthStates {}

class CodeSentState extends AuthStates {}

class CodeVerifiedState extends AuthStates {}

class LoggedInState extends AuthStates {
  final User firebaseUser;
  LoggedInState(this.firebaseUser);
}

class LoggoedOutState extends AuthStates {}

class ErrorState extends AuthStates {
  final String error;
  ErrorState(this.error);
}

class InitialState extends AuthStates {}

class LoadingState extends AuthStates {}
