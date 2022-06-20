import '../../model/LoginData/LoginData.dart';

abstract class ShopStates{}

class ShopInitialState extends ShopStates{}
class ChangeMode extends ShopStates{}
class LoginLoadState extends ShopStates{}
class LoginSuccessState extends ShopStates{
  LoginData loginData ;

  LoginSuccessState(this.loginData);
}
class LoginErrorState extends ShopStates{}
class RegisterLoadState extends ShopStates{}
class RegisterSuccessState extends ShopStates{

}
class RegisterErrorState extends ShopStates{}