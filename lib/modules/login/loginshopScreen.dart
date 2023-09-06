import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socail_applcation/layout/social_app.dart';
import 'package:socail_applcation/modules/login/cubit.dart';
import 'package:socail_applcation/modules/login/states.dart';
import 'package:socail_applcation/modules/registerScreen/RegisterScreen.dart';
import 'package:socail_applcation/shared/components/network/remote/CacheHelper.dart';
import 'package:socail_applcation/shared/components/widgets/components.dart';
import 'package:socail_applcation/shared/components/widgets/toast_widget.dart';


import '../../../shared/components/constants.dart';


class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // if (state is LoginSuccessState) {
          //   if (state.loginModel.status!) {
          //     showToast(
          //       text: state.loginModel.message!,
          //       state:toastStates.SUCCESS,
          //     );
          //     print(state.loginModel.message);
          //     print(state.loginModel.data!.token);
          //
          //     CacheHelper.saveData(
          //         key: "token", value: state.loginModel.data!.token)
          //         .then((value) {
          //       token = state.loginModel.data!.token!;
          //       navigateAndFinish(context, Social_app());
          //     });
          //   } else {
          //     showToast(
          //       text: state.loginModel.message!,
          //       state:toastStates.ERROR,              );
          //     print(state.loginModel.message);
          //   }
          // }
          if (state is LoginErrorState ){
            showToast(text: state.error, state: toastStates.ERROR);
          }
          if (state is LoginSuccessState){
            CacheHelper.saveData(
                key: "uId", value: state.uId
            )
                .then((value) {

              navigateAndFinish(context, Social_app());
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Login Now to communicate with your friends",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
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
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          prefix: Icons.key,
                          suffix: LoginCubit.get(context).suffix,
                          isPassword: LoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            LoginCubit.get(context).ChangePassword();
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
                        defaultTextButton(
                          function: () {},
                          text: "Forgotten password?",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => Center(
                            child: defaultMaterialButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);

                                }
                              },
                              text: 'Login',
                              radius: 10,

                            ),
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style:
                              TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            defaultTextButton(
                              function: () {
                                navigateTo(context, RegisterScreen());
                              },
                              text: 'Register Now!',
                            ),
                          ],
                        ),

                      ],
                    ),
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