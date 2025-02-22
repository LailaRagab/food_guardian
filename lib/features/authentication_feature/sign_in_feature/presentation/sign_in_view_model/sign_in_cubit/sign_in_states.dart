class SignInStates {}

class SignInInitial extends SignInStates {}

class SignInLoading extends SignInStates {}

class SignInSuccess extends SignInStates {}

class SignInFailure extends SignInStates {
  String messageError;

  SignInFailure({required this.messageError});
}
