
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/Layout/social_app/cubit/cubit.dart';
import 'package:shopapp/Layout/social_app/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state) {},
        builder: (context, state)
        {
          var cubit = SocialCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('${SocialCubit.get(context).titles[SocialCubit.get(context).currentIndex]}'),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeBottomNav(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.feed),
                label: 'Feed'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat),
                    label: 'Chat'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    label: 'Notifications'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings'),
              ],

            ),




          );
        },
    );

  }
}
