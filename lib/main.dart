import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Constants.dart';
import 'package:shopapp/controller/CacheHelper.dart';
import 'package:shopapp/controller/DioHelper.dart';
import 'package:shopapp/cubit/AppCubit/AppCubit.dart';
import 'package:shopapp/view/screen/OnBoardAndLogin/LoginScreen.dart';
import 'package:shopapp/view/screen/OnBoardAndLogin/OnBoardScreen.dart';
import 'package:shopapp/view/screen/ShopLayout.dart';

import 'cubit/ShopCubit/ShopCubit.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

 main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  DioHelper.init();
  await CacheHelper.init();
  var onBoarding = CacheHelper.getData(key: 'onBoarding');
   token =CacheHelper.getData(key: 'token');
  Widget startScreen;
if(onBoarding != null){
  if(token != null) {
    startScreen = ShopLayout();
  }else{
    startScreen =LoginScreen();
  }
}else{
  startScreen =OnBoardScreen();
}
  runApp(MyApp(
    onBoarding: onBoarding,
    token:token,startScreen: startScreen,
  ));
}

class MyApp extends StatelessWidget {
   var onBoarding;
   var token;
  final Widget startScreen;

  MyApp({required this.onBoarding,required this.token,required this.startScreen});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (BuildContext context) =>AppCubit()..getHomeData()..getCateData()..getProfileData(),),
        BlocProvider(create: (BuildContext context) =>ShopCubit(),),
      ],
      child: MaterialApp(
        title: 'OnBoardScreen',
        theme: ThemeData(
          primaryColor: Colors.blue
        ),
        debugShowCheckedModeBanner: false,
        home: startScreen,
      ),
    );
  }
}
