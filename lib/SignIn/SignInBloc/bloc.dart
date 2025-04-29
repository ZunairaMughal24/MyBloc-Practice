import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';

import 'Events.dart';
import 'states.dart';

class SignInBloc extends Bloc<SignInEvents, SignInStates> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Please enter a valid email address"));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState("Please enter a strong passworrd"));
      } else {
        emit(SignInValidState());
      }
    });
    on<SignInSubmitEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
