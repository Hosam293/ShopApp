import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/controller/CacheHelper.dart';
import 'package:shopapp/cubit/AppCubit/AppCubit.dart';
import 'package:shopapp/cubit/AppCubit/AppStates.dart';

import 'OnBoardAndLogin/LoginScreen.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<AppCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Salla',
            ),
            actions: [
              (cubit.titles[cubit.currentIndex] == 'Settings') ? IconButton(
                  onPressed: () {
                    cubit.changeMode();
                  }, icon: Icon(Icons.brightness_4_outlined)) : Container()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items:
            [
              BottomNavigationBarItem(
                  icon: Icon(Icons.production_quantity_limits_outlined),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline_rounded),
                  label: 'Favourites'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
            onTap: (index) {
              cubit.changeIndex(index);
            },
            currentIndex: cubit.currentIndex,
            type:BottomNavigationBarType.fixed ,

            // selectedItemColor: Colors.blue,
            // unselectedItemColor: Colors.grey,
          ),
          body: cubit.screen[cubit.currentIndex],
        );
      },
    );
  }
}
