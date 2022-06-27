import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/cubit/AppCubit/AppCubit.dart';
import 'package:shopapp/cubit/AppCubit/AppStates.dart';
import 'package:shopapp/view/screen/OnBoardAndLogin/LoginScreen.dart';

import '../../../controller/CacheHelper.dart';

class Settings extends StatelessWidget {
 var formKey = GlobalKey<FormState>();
 var nameController = TextEditingController();
 var emailController = TextEditingController();
 var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){
        if(state is ProfileSuccessState){
          nameController.text =state.profileModel!.data!.name!;
          emailController.text =state.profileModel!.data!.email!  ;
          phoneController.text =state.profileModel!.data!.phone!  ;
        }
      },
      builder: (context,state)
      {

        var cubit = BlocProvider.of<AppCubit>(context);

        return  ConditionalBuilder(
          condition: cubit.profileModel != null,
          builder: (context)=> Padding(
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

                          prefixIcon: Icon(Icons.drive_file_rename_outline_outlined,color: Colors.grey,),



                        ) ,
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
                          labelText: 'email',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15
                          ),
                          border:  OutlineInputBorder(),
                          focusedBorder:OutlineInputBorder(borderSide:BorderSide(color: Colors.deepOrange) )  ,

                          prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,),



                        ) ,
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
                          labelText: 'phone',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15
                          ),
                          border:  OutlineInputBorder(),
                          focusedBorder:OutlineInputBorder(borderSide:BorderSide(color: Colors.deepOrange) )  ,

                          prefixIcon: Icon(Icons.phone,color: Colors.grey,),



                        ) ,
                        validator: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'please fill the form';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: MaterialButton(onPressed: ()
                        {
                          CacheHelper.removeData(key: 'token').then((value)
                          {
                            Navigator.pushReplacement(context, MaterialPageRoute (
                              builder: (BuildContext context) => LoginScreen(),
                            ),
                            );
                          });
                        },child: Text(
                          'Logout',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20)

                        ),
                          color: Colors.blue,
                          elevation: 0.0,

                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: MaterialButton(onPressed: ()
                        {
                          if(formKey.currentState!.validate()){
                            cubit.updateProfileData(name: nameController.text, email: emailController.text, phone: phoneController.text);

                          }
                        },child: Text(
                          'Update',style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,

                        ),

                        ),
                          color: Colors.blue,
                          elevation: 0.0,

                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
          fallback: (context)=> Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
