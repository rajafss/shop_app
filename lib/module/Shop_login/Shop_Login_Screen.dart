
import 'package:flutter/material.dart';
import 'package:shopapp/module/Shop_login/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:shopapp/network/local/cache_helper.dart';
import 'package:shopapp/shared/component/component.dart';
import 'package:shopapp/shared/constant/constant.dart';

import '../../Layout/home_layout_screen.dart';
import '../shop_register/shop_register_screen.dart';
import 'cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShopLoginScreen extends StatelessWidget {
var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    var emailControler = TextEditingController();
    var passwordControler = TextEditingController();
    return  BlocConsumer<ShopLoginCubit,ShopLoginState>(
        listener: (context,state){
          if(state is ShopLoginSuccessState)
          {
            if(state.loginModel.status)
            {
              print(state.loginModel.data);
              print(state.loginModel.data.name);
              print(state.loginModel.data.token);
              CacheHelper.saveToken(key: 'token',
                  value: state.loginModel.data.token
              ).then((value)
              {
                token = state.loginModel.data.token;
                navigateAndFinish(context, HomeLayoutScreen());
              });
              Fluttertoast.showToast(
                  msg: 'sucessful done login ',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 6,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
              navigateAndFinish(context, HomeLayoutScreen());
            }

          }
        },
        builder: (context,state) => Scaffold(
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
                      Text('LOGIN',
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.black
                          )),
                      Text('login now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.black26
                          )),
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
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordControler,

                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'please enter your password';
                          }
                        },

                        obscureText: ShopLoginCubit.get(context).isPassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed:()
                            {
                              ShopLoginCubit.get(context).changePasswordvisibility();
                            },
                            icon: Icon(ShopLoginCubit.get(context).suffix),),
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),

                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! ShopLoginLoadingState,
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
                                ShopLoginCubit.get(context).userLogin(
                                    email: emailControler.text,
                                    password: passwordControler.text);
                              }
                            },
                            child: Text('LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                )
                            ),
                          ),
                        ),
                        fallback: (context) => Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('don\'t have an accout?'),
                          TextButton(onPressed: (){
                            navigateTo(context, ShopRegisterScreen());
                          },
                            child: Text("Register"),),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  }
}
