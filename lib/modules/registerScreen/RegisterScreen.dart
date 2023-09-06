import 'dart:io';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socail_applcation/layout/social_app.dart';
import 'package:socail_applcation/modules/login/loginshopScreen.dart';
import 'package:socail_applcation/modules/registerScreen/stetes.dart';
import 'package:socail_applcation/shared/components/constants.dart';
import 'package:socail_applcation/shared/components/network/remote/CacheHelper.dart';
import 'package:socail_applcation/shared/components/widgets/components.dart';
import 'package:socail_applcation/shared/components/widgets/toast_widget.dart';


import 'cubit.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var nameController = TextEditingController();

  var phoneController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is CreateUserSuccessState){
            navigateAndFinish(context, Social_app());
          }
          },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Register'),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(children: [
                      defaultTextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        prefix: Icons.person,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                        label: 'Name',
                        hint: 'Enter your name',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultTextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        prefix: Icons.email,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                        label: 'Email',
                        hint: 'Enter your email',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultTextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        prefix: Icons.phone,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter phone';
                          }
                          return null;
                        },
                        label: 'Phone',
                        hint: 'Enter your phone',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultTextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        prefix: Icons.key,
                        suffix: RegisterCubit.get(context).suffix,
                        isPassword: RegisterCubit.get(context).isPassword,
                        suffixPressed: () {
                          RegisterCubit.get(context).changePassword();
                        },
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        label: 'Password',
                        hint: 'Enter your password',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ConditionalBuilder(
                        condition: state is! RegisterLoadingState,
                        builder: (context) => Center(
                          child: defaultMaterialButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            text: 'Register',
                            radius: 20,
                          ),
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                    ]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}