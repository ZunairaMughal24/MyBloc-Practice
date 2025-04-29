abstract class SignInEvents {}

class SignInTextChangedEvent extends SignInEvents {
  final String emailValue;
  final String passwordValue;
  SignInTextChangedEvent(this.emailValue, this.passwordValue);
}

class SignInSubmitEvent extends SignInEvents {
  final String email;
  final String password;
  SignInSubmitEvent(this.email, this.password);
}
