

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/module/shop_register/cubit/states.dart';

import '../../../models/users/user_model.dart';
import '../../../network/remote/dio_helper.dart';



class ShopRegisterCubit extends Cubit<ShopRegisterState>{

  ShopRegisterCubit(): super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    @required String? name,
    @required String? email,
    @required String? phone,
    @required String? password
  })
  {
    emit(ShopRegisterLoadingState());
    ShopDioHelper.postData(
        url: 'https://student.valuxapps.com/api/register',
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
        }).then((value)
    {
      value.data;
      var loginModel = ShopUserModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(loginModel));


    }).catchError((error)
    {
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordvisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off;

    emit(ShopRegisterChangePasswordVisibilityState());
    throw Exception();

  }

}