import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Layout/cubit/states.dart';
import 'package:shopapp/module/Shop_login/Shop_Login_Screen.dart';
import 'package:shopapp/module/onbording/onbording_screen.dart';
import 'package:shopapp/network/local/cache_helper.dart';
import 'package:shopapp/shared/constant/constant.dart';

import '../module/search/search_screen.dart';
import '../shared/component/component.dart';
import 'cubit/cubit.dart';

class HomeLayoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // var cubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context,state){},
      builder: (context, state){
        return Scaffold(
          appBar: AppBar(
            title: Text(ShopCubit.get(context).titles[ShopCubit.get(context).currentIndex],
            style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.pink.shade700)),
            actions: [
              IconButton(onPressed: (){
                navigateTo(context, SearchScreen());
              }, icon: Icon(Icons.search)),
              // IconButton(onPressed: (){
              //   navigateTo(context, ProfileScreen());
              // },
              //     icon: Icon(
              //       Icons.person_outline_sharp,
              //       color: Colors.pink.shade700,)
              // ),
              TextButton(onPressed: (){
                CacheHelper.removeData(key: 'token').then((value)
                {
                  if(value!) navigateAndFinish(context, OnBoardingScreen());
                });
              }, child: Text('Logout')),

            ],
            //   TextButton(onPressed: (){
            //
            //     navigateTo(context, OnBoardingScreen());
            //     // CachHelper.removeData(key: 'token').then((value)
            //     // {
            //     //   if(value) navigateAndFinish(context, ShopLoginScreen());
            //     // });
            //   }, child: Text('LOGOUT')),
            // ],
          ),
          body: ShopCubit.get(context).screens[ShopCubit.get(context).currentIndex],

          bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
                ShopCubit.get(context).changeBottomNav(index);
              },
              currentIndex: ShopCubit.get(context).currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.apps),
                  label: 'New',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded),
                  label: 'Profile',
                ),
              ]),

        );
      },

    );
  }
}
