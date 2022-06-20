import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/controller/DioHelper.dart';
import 'package:shopapp/model/LoginData/LoginData.dart';

import '../../Constants.dart';
import '../../model/HomeModel.dart';
import '../../model/ProfileModel/ProfileModel.dart';
import 'ShopStates.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of<ShopCubit>(context);
  bool isPassword = true;
  Widget suffixIcon = Icon(
    Icons.visibility,
    color: Colors.grey,
  );

  void changePassMode() {
    isPassword = !isPassword;
    if (isPassword) {
      suffixIcon = Icon(
        Icons.visibility,
        color: Colors.grey,
      );
    } else {
      suffixIcon = Icon(
        Icons.visibility_off,
        color: Colors.blue,
      );
    }

    emit(ChangeMode());
  }
  LoginData? loginData;
  void userLogin({required String email, required String password}) {
    emit(LoginLoadState());
    DioHelper.postData(
        url: 'login',
        data: {'email': email, 'password': password}).then((value) {
      print(value.data);
       loginData = LoginData.fromJson(value.data);
      emit(LoginSuccessState(loginData!));
    }).catchError((onError) {
      print(onError.toString());
      emit(LoginErrorState());
    });
  }

  void userRegister({required String email, required String password,required String phone,required String name}) {
    emit(RegisterLoadState());
    DioHelper.postData(
        url: 'register',
        data: {'email': email, 'password': password,'name':name,'phone':phone}).then((value) {
      print(value.data);
      emit(RegisterSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(RegisterErrorState());
    });
  }
}
