import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:socail_applcation/models/loginModel.dart';
import 'package:socail_applcation/models/social_user_model.dart';
import 'package:socail_applcation/modules/registerScreen/stetes.dart';
import 'package:socail_applcation/shared/components/network/local/dio_helper.dart';
import 'package:socail_applcation/shared/components/network/remote/endpoint.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;
  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
    String? image,
  }) {
    emit(RegisterLoadingState());
    // DioHelper.postData(
    //   url: register,
    //   data: {
    //     'email': email,
    //     'password': password,
    //     'name': name,
    //     'phone': phone,
    //     'image': image,
    //   },
    // ).then((value) {
    //   loginModel = LoginModel.fromJson(value.data);
    //   emit(RegisterSuccessState(loginModel!));
    // }).catchError((error) {
    //   emit(RegisterErrorState(error.toString()));
    // });

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      UserCreate(email: email, name: name, phone: phone, uId: value.user!.uid);
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  void UserCreate({
    required String email,
    required String name,
    required String phone,
    required String uId,
  }) {
    Social_User_Model model = Social_User_Model(
        email: email,
        name: name,
        phone: phone,
        UId: uId,
        cover:
            'https://imagedelivery.net/WS9ABFRS6TfdqDudkFOT3w/grrraphic/previews/lc92ONuZ1fdT7LS8R3nkcDhhCD28Y552SOlJuaLu.jpeg/public',
        bio: 'Write your bio....',
        image: 'https://imagedelivery.net/WS9ABFRS6TfdqDudkFOT3w/grrraphic/previews/freelance-woman-entrepreneur-calling-in-home-office-free-photo-2210x1473.jpg/public',
        isEmailvarified: false);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordRegisterState());
  }
}
