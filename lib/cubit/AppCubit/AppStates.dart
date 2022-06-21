import 'package:shopapp/model/ProfileModel/ProfileModel.dart';

import '../../model/LoginData/LoginData.dart';

abstract class AppStates{}
class AppInitialState extends AppStates{}
class ChangeIndex extends AppStates{}
class HomeLoadingState extends AppStates{}
class HomeSuccessState extends AppStates{}
class HomeErrorState extends AppStates{}
class CateLoadingState extends AppStates{}
class CateSuccessState extends AppStates{}
class CateErrorState extends AppStates{}
class ChangeFavLoadingState extends AppStates{}
class ChangeFavSuccessState extends AppStates{}
class ChangeFavErrorState extends AppStates{}
class ProfileLoadingState extends AppStates{}
class ProfileSuccessState extends AppStates{
  ProfileModel? profileModel;

  ProfileSuccessState(this.profileModel);
}
class ProfileErrorState extends AppStates{}
class UpdateDataLoadingState extends AppStates{}
class UpdateDataSuccessState extends AppStates{}
class UpdateDataErrorState extends AppStates{}
class ChangeMode extends AppStates{}
class LoginLoadState extends AppStates{}
class LoginSuccessState extends AppStates{
  LoginData loginData ;

  LoginSuccessState(this.loginData);
}
class LoginErrorState extends AppStates{}
class RegisterLoadState extends AppStates{}
class RegisterSuccessState extends AppStates{

}
class RegisterErrorState extends AppStates{}
class ChangeDarkMode extends AppStates{}

