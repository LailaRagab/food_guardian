import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/features/authentication_feature/register_feature/presentation/register_view_model/register_cubit/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(LoadingState());
  Future<void> registerUser(
      {required email, required password, required name, String? image}) async {
    emit(LoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SuccessState());
      await credential.user?.updateDisplayName(name);
      await credential.user?.updatePhotoURL(image);
      await credential.user?.reload();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(FailureState(errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(FailureState(
            errorMessage: 'The account already exists for that email.'));
      } else if (e.code == 'network-request-failed') {
        emit(FailureState(
            errorMessage: 'Please check your internet connection.'));
      } else if (e.code == 'too-many-requests') {
        emit(FailureState(
            errorMessage: 'Too many failed attempts. Try again later.'));
      } else if (e.code == 'invalid-email') {
        emit(FailureState(errorMessage: 'The email format is invalid.'));
      }
    } catch (e) {
      emit(FailureState(errorMessage: "There is an error"));
    }
  }
}
