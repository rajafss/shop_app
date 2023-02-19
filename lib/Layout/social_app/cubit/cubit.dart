
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Layout/social_app/cubit/states.dart';
import 'package:shopapp/models/social_app/social_User_model.dart';
import 'package:shopapp/module/social_app/chats/chat_screen.dart';
import 'package:shopapp/module/social_app/feed/feed_screen.dart';
import 'package:shopapp/module/social_app/notifications/notification_screen.dart';
import 'package:shopapp/module/social_app/settings/settings_screen.dart';
import 'package:shopapp/shared/constant/constant.dart';

class SocialCubit extends Cubit<SocialStates>
{
  SocialCubit():super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);


  SocialUserModel? model;

  void getUserData()
  {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId).get().then((value)
    {
      print(value.data());
      model = SocialUserModel.fromJson(value.data()!);
      emit(SocialGetUserSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
    });

  }

  List<String> titles =
  [
    'Feeds',
    'Chats',
    'Notifications',
    'Settings'
  ];

int currentIndex = 0;

  /// List of screens navigation bar
 List<Widget> screens =
 [
   FeedScreen(),
   NotificationScreen(),
   ChatScreen(),
   SettingsScreen()
 ];

  /// change navigation bar
  void changeBottomNav(int index)
  {
    currentIndex = index;
    emit(ChangeNavigationBarState());
  }
}