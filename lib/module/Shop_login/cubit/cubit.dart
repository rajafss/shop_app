

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/module/Shop_login/cubit/states.dart';

import '../../../models/users/user_model.dart';
import '../../../network/remote/dio_helper.dart';
import '../../../shared/router.dart';



class ShopLoginCubit extends Cubit<ShopLoginState>{

  ShopLoginCubit(): super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    @required String? email,
    @required String? password
  })
  {
    emit(ShopLoginLoadingState());
    ShopDioHelper.postData(
        url: LOGIN,
        data: {
          'email': email,
          'password': password,
        }).then((value)
    {
      value.data;
      var loginModel = ShopUserModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel));


    }).catchError((error) {
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordvisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off;

    emit(ShopChangePasswordVisibilityState());
    throw Exception();

  }

}