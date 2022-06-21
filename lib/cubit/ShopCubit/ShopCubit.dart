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


}
