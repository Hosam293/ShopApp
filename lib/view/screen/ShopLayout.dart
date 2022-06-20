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
    return BlocConsumer<AppCubit,AppStates>(
     listener: (context,state){},
      builder: (context,state)
      {
        var cubit = BlocProvider.of<AppCubit>(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text(
                'Salla',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            actions: [
              IconButton(onPressed: (){
                CacheHelper.removeData(key: 'token').then((value)
                {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          LoginScreen(),
                    ),
                  );
                });
              }, icon: Icon(Icons.logout))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items:
            [
              BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits_outlined),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_rounded),label: 'Favourites'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
            ],
            onTap: (index)
            {
              cubit.changeIndex(index);

            },
            currentIndex: cubit.currentIndex,
            selectedItemColor: Colors.blue,unselectedItemColor: Colors.grey,
          ),
          body: cubit.screen[cubit.currentIndex],
        );
      },
    );
  }
}
