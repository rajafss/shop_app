import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/Layout/cubit/cubit.dart';
import 'package:shopapp/Layout/cubit/states.dart';
import 'package:shopapp/Layout/home_layout_screen.dart';
import 'package:shopapp/Layout/social_app/cubit/cubit.dart';
import 'package:shopapp/network/local/cache_helper.dart';
import 'package:shopapp/shared/style/themes.dart';
import 'module/Shop_login/cubit/cubit.dart';
import 'module/categories/cubit/cubit.dart';
import 'module/onbording/onbording_screen.dart';
import 'network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  CacheHelper.init();
  ShopDioHelper.init();

  // Widget widget;
  // var onBoarding = CacheHelper.getData(key: 'boarding') ;
  // String token = CacheHelper.getData(key: 'vTGMWyz4e8WIJIZm5VfHCcKTF2B1B8EJN8pxpejTP81tAPJmH0AKu5kDTS1f7TqNZmAZBi');
  // if(token !=null){
  //   print(token);
  // }
  // print(token);
  //
  // if(onBoarding == null)
  //   {
  //     if(token != null)
  //     {
  //       widget = HomeLayoutScreen();
  //     }else
  //     {
  //       widget = ShopLoginScreen();
  //     }
  //   }else
  //   {
  //     widget = OnBoardingScreen();
  //   }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//
// final token;
// MyApp({required this.token});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String token = CacheHelper.getToken(key: 'token')?? '';
    if(token != null)
    {

      print('token: ${token}');
    }
    else
    {
      print('object');
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ShopCategoryCubit()..getProducts()..getCategoriesProducts()..getFavorites()..getProfile()),
        BlocProvider(create: (context) => ShopCubit()..fetchdataProduct(),),
        BlocProvider(create: (context) => ShopLoginCubit(),),
        BlocProvider(create: (context) => SocialCubit()..getUserData(),),
      ],
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state){
         return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: token != null ? HomeLayoutScreen() : OnBoardingScreen(),
          );
        }
          // token != null ? HomeLayoutScreen() : OnBoardingScreen(),

      ),
    );
  }
}


