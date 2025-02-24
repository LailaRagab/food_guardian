import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_guardian/features/authentication_feature/sign_in_feature/presentation/sign_in_view_model/sign_in_cubit/sign_in_states.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitial());

  Future<void> signInAuth({required email, required password}) async {
    emit(SignInLoading());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(SignInSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'invalid-credential') {
        emit(SignInFailure(errorMessage: 'Incorrect email or password.'));
      } else if (ex.code == 'too-many-requests') {
        emit(SignInFailure(
            errorMessage: 'Too many failed attempts. Try again later.'));
      } else if (ex.code == 'network-request-failed') {
        emit(SignInFailure(
            errorMessage: 'Please check your internet connection.'));
      }
    } catch (e) {
      emit(SignInFailure(errorMessage: "There is an error"));
    }
  }
}
