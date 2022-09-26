

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/Layout/social_app/social_layout.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:shopapp/module/shop_register/cubit/cubit.dart';
import 'package:shopapp/module/shop_register/cubit/states.dart';
import 'package:shopapp/module/social_app/register/cubit/cubit.dart';
import 'package:shopapp/module/social_app/register/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/shared/component/component.dart';

class RegisterScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();

  var emailControler = TextEditingController();
  var passwordControler = TextEditingController();
  var nameControler = TextEditingController();
  var phonedControler = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit , SocialRegisterState>(
        listener: (context, state)
        {
          if(state is SocialCreateUserSuccessState)
          {
            navigateAndFinish(context, SocialLayout());
          }
        },
        builder: (context, state)=> Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('REGISTER',
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.black
                          )),
                      Text('Register now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.black26
                          )),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: nameControler,
                        validator: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'please enter your name';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Name",
                          prefixIcon: Icon(Icons.person_outline_rounded),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailControler,
                        validator: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'please enter your email address';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Email Address",
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: phonedControler,

                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'please enter your phone number';
                          }
                        },

                        decoration: InputDecoration(
                          labelText: "Phone",
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),

                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordControler,

                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'please enter your password';
                          }
                        },

                        obscureText: SocialRegisterCubit.get(context).isPassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed:()
                            {
                              SocialRegisterCubit.get(context).changePasswordvisibility();
                            },
                            icon: Icon(SocialRegisterCubit.get(context).suffix),),
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),

                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! SocialRegisterLoadingState,
                        builder: (context) =>  Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.pink.shade700,
                          ),
                          child: MaterialButton(
                            onPressed: ()
                            {
                              if(formkey.currentState!.validate())
                              {
                                SocialRegisterCubit.get(context).userRegister(
                                    name:nameControler.text,
                                    email: emailControler.text,
                                    phone: phonedControler.text,
                                    password: passwordControler.text);
                              }
                            },
                            child: Text('REGISTER',
                                style: TextStyle(
                                  color: Colors.white,
                                )
                            ),
                          ),
                        ),
                        fallback: (context) => Center(child: CircularProgressIndicator()),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

