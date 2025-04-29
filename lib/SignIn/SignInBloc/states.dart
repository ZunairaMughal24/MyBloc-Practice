abstract class SignInStates {}

class SignInInitialState extends SignInStates {}

class SignInValidState extends SignInStates {}

class SignInErrorState extends SignInStates {
  final String eroorMessage;
  SignInErrorState(this.eroorMessage);
}

class SignInLoadingState extends SignInStates {}
