import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_guardian/features/authentication_feature/sign_in_feature/presentation/sign_in_view_model/sign_in_cubit/sign_in_states.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitial());

  Future<void> signInAuth({required email, required password}) async {
    emit(SignInLoading());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      emit(SignInSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(SignInFailure(messageError: 'No user found for that email.'));
      } else if (ex.code == 'wrong-password') {
        emit(SignInFailure(
            messageError: 'Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(SignInFailure(messageError: "There is an error"));
    }
  }
}
