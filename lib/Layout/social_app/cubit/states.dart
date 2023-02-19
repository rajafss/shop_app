
import 'package:shopapp/Layout/social_app/cubit/states.dart';

abstract class SocialStates{}

class SocialInitialState extends SocialStates{}

class SocialGetUserLoadingState extends SocialStates{}

class SocialGetUserSuccessState extends SocialStates{}

class SocialGetUserErrorState extends SocialStates
{
  final error;

  SocialGetUserErrorState(this.error);

}


class ChangeNavigationBarState extends SocialStates{}