
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/controller/CacheHelper.dart';
import 'package:shopapp/cubit/ShopCubit/ShopCubit.dart';
import 'package:shopapp/cubit/ShopCubit/ShopStates.dart';
import 'package:shopapp/view/screen/OnBoardAndLogin/RegisterScreen.dart';
import 'package:shopapp/view/screen/ShopLayout.dart';


class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state)
      {
        if(state is LoginSuccessState)
        {
          CacheHelper.saveData(key: 'token', value: '${state.loginData.data!.token}').then((value)
          {
            Fluttertoast.showToast(
                msg: '${state.loginData.message}',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    ShopLayout(),
              ),
            );
          });

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
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Login To See what you want',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.grey),
                      ),
                      SizedBox(
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

                          prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,),



                        ) ,
                        onFieldSubmitted: (value)
                        {
                          if(formKey.currentState!.validate())
                          {
                            cubit.userLogin(email: emailController.text, password: passwordController.text);
                          }
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
                        controller: passwordController,
                        keyboardType:TextInputType.visiblePassword ,
                        decoration:InputDecoration(
                            labelText: 'password',
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
                              cubit.userLogin(email: emailController.text, password: passwordController.text);

                            }
                          },child: Text(
                            'Login',style: TextStyle(
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
                          const Text(
                            'Don\'t Have Email ? ',style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                          TextButton(onPressed: ()
                          {
                            Navigator.pushReplacement(context,MaterialPageRoute (
                              builder: (BuildContext context) =>  RegisterScreen(),
                            ),
                            );
                          }, child: Text(
                            'Register Now',
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
