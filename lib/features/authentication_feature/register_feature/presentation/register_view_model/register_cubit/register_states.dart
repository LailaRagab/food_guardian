class RegisterStates {}

class InitialState extends RegisterStates {}

class LoadingState extends RegisterStates {}

class SuccessState extends RegisterStates {}

class FailureState extends RegisterStates {
  String errorMeassage;
  FailureState({required this.errorMeassage});
}
