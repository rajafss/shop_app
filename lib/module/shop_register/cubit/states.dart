

import '../../../models/users/user_model.dart';

abstract class ShopRegisterState{}

class ShopRegisterInitialState extends ShopRegisterState{}

class ShopRegisterLoadingState extends ShopRegisterState{}

class ShopRegisterSuccessState extends ShopRegisterState{
  final ShopUserModel loginModel ;

  ShopRegisterSuccessState(this.loginModel);
}

class ShopRegisterErrorState extends ShopRegisterState{

  final String error;

  ShopRegisterErrorState(this.error);

}


class ShopRegisterChangePasswordVisibilityState extends ShopRegisterState{}
