import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/cubit/ShopCubit/ShopCubit.dart';
import 'package:shopapp/view/screen/OnBoardAndLogin/LoginScreen.dart';

import '../../../cubit/ShopCubit/ShopStates.dart';

class RegisterScreen extends StatelessWidget {
var formKey =GlobalKey<FormState>();
var nameController =TextEditingController();
var emailController =TextEditingController();
var passwordController =TextEditingController();
var phoneController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state)
      {
        if(state is RegisterSuccessState)
        {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
              builder: (BuildContext context) =>
              LoginScreen(),
        ));

        }
      },
      builder: (context,state)
      {
        var cubit = BlocProvider.of<ShopCubit>(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      TextFormField(
                        controller: nameController,
                        keyboardType:TextInputType.name ,
                        decoration:InputDecoration(
                          labelText: 'name',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15
                          ),
                          border:  OutlineInputBorder(),
                          focusedBorder:OutlineInputBorder(borderSide:BorderSide(color: Colors.deepOrange) )  ,




                        ) ,
                        onFieldSubmitted: (value)
                        {

                        },
                        validator: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'please fill the form';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType:TextInputType.emailAddress ,
                        decoration:InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15
                          ),
                          border:  OutlineInputBorder(),
                          focusedBorder:OutlineInputBorder(borderSide:BorderSide(color: Colors.deepOrange) )  ,

                          prefixIcon: Icon(Icons.lock_outline_rounded,color: Colors.grey,),
                          suffixIcon: IconButton(icon:cubit.suffixIcon,color: Colors.grey,onPressed: ()
                          {
                            cubit.changePassMode();

                          }),


                        ) ,
                        obscureText: cubit.isPassword,
                        validator: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'please fill the form';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType:TextInputType.visiblePassword ,
                        decoration:InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15
                          ),
                          border:  OutlineInputBorder(),
                          focusedBorder:OutlineInputBorder(borderSide:BorderSide(color: Colors.deepOrange) )  ,

                          prefixIcon: Icon(Icons.lock_outline_rounded,color: Colors.grey,),
                          suffixIcon: IconButton(icon:cubit.suffixIcon,color: Colors.grey,onPressed: ()
                          {
                            cubit.changePassMode();

                          }),


                        ) ,
                        obscureText: cubit.isPassword,
                        validator: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'please fill the form';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      TextFormField(
                        controller: phoneController,
                        keyboardType:TextInputType.phone ,
                        decoration:InputDecoration(
                          labelText: 'Phone',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15
                          ),
                          border:  OutlineInputBorder(),
                          focusedBorder:OutlineInputBorder(borderSide:BorderSide(color: Colors.deepOrange) )  ,

                          prefixIcon: Icon(Icons.lock_outline_rounded,color: Colors.grey,),
                          suffixIcon: IconButton(icon:cubit.suffixIcon,color: Colors.grey,onPressed: ()
                          {
                            cubit.changePassMode();

                          }),


                        ) ,
                        obscureText: cubit.isPassword,
                        validator: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'please fill the form';
                          }
                          return null;
                        },
                      ),
                      Container(
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: ConditionalBuilder(
                          condition: state is! LoginLoadState,
                          builder: (context)=>MaterialButton(onPressed: ()
                          {
                            if(formKey.currentState!.validate())
                            {
                              cubit.userRegister(email: emailController.text, password: passwordController.text, name: nameController.text, phone: phoneController.text);

                            }
                          },child: Text(
                            'Register',style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,

                          ),

                          ),
                            color: Colors.blue,
                            elevation: 0.0,

                          ),
                          fallback: (context)=> Center(child: CircularProgressIndicator(),),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [

                          TextButton(onPressed: ()
                          {
                            Navigator.pushReplacement(context, MaterialPageRoute (
                              builder: (BuildContext context) =>  LoginScreen(),
                            ));
                          }, child: Text(
                            'Login',
                          ),

                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}