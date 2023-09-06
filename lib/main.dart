// ignore_for_file: unnecessary_null_comparison

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socail_applcation/layout/cubit/cubit.dart';
import 'package:socail_applcation/layout/social_app.dart';
import 'package:socail_applcation/modules/login/loginshopScreen.dart';
import 'package:socail_applcation/shared/components/constants.dart';
import 'package:socail_applcation/shared/components/network/local/dio_helper.dart';
import 'package:socail_applcation/shared/components/network/remote/CacheHelper.dart';
import 'package:socail_applcation/shared/components/widgets/bloc_observe.dart';
import 'package:socail_applcation/shared/components/widgets/components.dart';
import 'package:socail_applcation/shared/styles/themes.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await CacheHelper.init();
  DioHelper.init();


  Widget widget;
  uId = CacheHelper.getData(key: 'uId');
  print(uId);
  if(uId != null){
    widget =Social_app();
  }else{
    widget =LoginScreen();
  }
  Bloc.observer = MyBlocObserver();
  runApp( MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.startWidget});
  final Widget startWidget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) =>SocialCubit()..getUserData(),
      child: MaterialApp(
        theme: lightTheme,
          debugShowCheckedModeBanner: false,
        home: startWidget,
      ),
    );
  }
}

