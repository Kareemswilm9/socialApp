
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:socail_applcation/models/loginModel.dart';
import 'package:socail_applcation/modules/login/states.dart';
import 'package:socail_applcation/shared/components/network/local/dio_helper.dart';
import 'package:socail_applcation/shared/components/network/remote/endpoint.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  void userLogin({required String email, required String password}) {
    emit(LoginLoadingState());
   FirebaseAuth.instance.signInWithEmailAndPassword(
       email: email,
       password: password).then((value) {
         emit(LoginSuccessState(value.user!.uid));
   }).catchError((error){
     emit(LoginErrorState(error.toString()));
   });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  // ignore: non_constant_identifier_names
  void ChangePassword() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordState());
  }
}