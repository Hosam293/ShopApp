import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Constants.dart';
import 'package:shopapp/controller/DioHelper.dart';
import 'package:shopapp/cubit/AppCubit/AppStates.dart';
import 'package:shopapp/model/CategoryDataModel/CategoryDataModel.dart';
import 'package:shopapp/model/ChangeFavModel/ChangeFavModel.dart';
import 'package:shopapp/model/HomeModel.dart';
import 'package:shopapp/view/screen/ShopScreens/Categories.dart';
import 'package:shopapp/view/screen/ShopScreens/Favourites.dart';
import 'package:shopapp/view/screen/ShopScreens/Products.dart';
import 'package:shopapp/view/screen/ShopScreens/Settings.dart';

import '../../controller/CacheHelper.dart';
import '../../model/LoginData/LoginData.dart';
import '../../model/ProfileModel/ProfileModel.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);
  List<String>titles=
  [
    '',
    '',
    '',
    'Settings',
  ];
  bool isDark =false;
  void changeMode({ var isShared})
  {
    if(isShared != null){
      isDark = isShared;
      emit(ChangeDarkMode());

    }else{
      isDark =!isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark)
          .then((value)
      {
        emit(ChangeDarkMode());
      });

    }

  }
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
  int currentIndex = 0;

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeIndex());
  }

  List<Widget> screen =
  [
    Products(),
    Categories(),
    Favourites(),
    Settings()

  ];
  HomeModel? homeModel;
  Map <dynamic, dynamic> favourites = {};

  void getHomeData() {
    emit(HomeLoadingState());
    DioHelper.getData(url: 'home', token: token).then((value) {
      print(value.data);
      print('sjskasjdalsdkflsdfksdfasasasdasdasdasdasdasdsd${value.data}');

      homeModel = HomeModel.fromJson(value.data);
      print('hgjglljlgj${homeModel!.data!.products[0].id}');
      homeModel!.data!.products.forEach((element) {
        favourites.addAll({element.id!: element.inFavorites!});
      });
      print('wddadsdasdasdasdasdasdasdasdasdasd${favourites.keys}');
      emit(HomeSuccessState());
    }).catchError((error) {
      emit(HomeErrorState());
    });
  }
ChangeFavModel? changeFavModel;
  void changeFavState(dynamic productId) {
    favourites[productId] =! favourites[productId]!;
    emit(ChangeFavLoadingState());
    DioHelper.postData(url: 'favorites', data:
    {
      'product_id': productId
    },
        token: token).then((value) {
          changeFavModel = ChangeFavModel.fromJson(value.data);
if(!changeFavModel!.status!)
{
  favourites[productId] =! favourites[productId]!;

}
          emit(ChangeFavSuccessState());
    }).catchError((error) {
      favourites[productId] =! favourites[productId]!;

      emit(ChangeFavErrorState());
    });
  }
CategoryModel? categoryModel;
 void getCateData()
 {
emit(CateLoadingState());
DioHelper.getData(url: 'categories',
token: token).then((value)
{
  print('sjskasjdakjsdajksdasjkdsd${value.data}');
  categoryModel=CategoryModel.fromJson(value.data);
  emit(CateSuccessState());
}).catchError((error)
{
  emit(CateErrorState());
});
 }
  ProfileModel? profileModel;

  void getProfileData() {
    emit(ProfileLoadingState());
    DioHelper.getData(url: 'profile', token: token).then((value) {
      print('this is profile data${value.data}');

      profileModel = ProfileModel.fromJson(value.data);

      emit(ProfileSuccessState( profileModel));
    }).catchError((error) {
      emit(ProfileErrorState());
    });
  }

  void updateProfileData({
    required String name,
    required String email,
    required String phone,
  })
  {
    emit(UpdateDataLoadingState());
    DioHelper.putData(url: 'update-profile', data:
    {
      "name":name,
      "email":email,
      "phone":phone,
    },
        token: token
    ).then((value)
    {
      print(value.data);
      getProfileData();
      profileModel = ProfileModel.fromJson(value.data);
      emit(UpdateDataSuccessState());
    }).catchError((error){
      getProfileData();

      emit(UpdateDataErrorState());
    });
  }

}