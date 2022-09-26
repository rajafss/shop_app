import 'dart:convert';
import 'dart:ffi';

import 'package:shopapp/Layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/models/users/user_model.dart';
import 'package:shopapp/module/product_detailes/product_detailes_screen.dart';
import 'package:shopapp/module/profile/profile_screen.dart';
import 'package:shopapp/network/remote/dio_helper.dart';
import 'package:shopapp/shared/constant/constant.dart';
import 'package:shopapp/shared/router.dart';

import '../../models/product_model/product.dart';
import '../../module/categories/categories_screen.dart';
import '../../module/categories/list_categories.dart';
import '../../module/favorite/favorite_screen.dart';
import '../../module/product/product_screen.dart';
import '../../module/settings/settings_screen.dart';
import 'package:http/http.dart' as http;

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());




  static ShopCubit get(context) => BlocProvider.of(context);






  int currentIndex = 0;

  List<Widget> screens = [
    ProductScreen(),
    CategorieScreen(),
    ListCategoriesScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  List<String> titles = [

    'Product',
    'Categories',
    'List Categories',
    'Favorite',
    'Profile',
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  // List<dynamic> product = [];
  // fetchdata() async{
  //   var url = "https://dummyjson.com/products";
  //   var response = await http.get(Uri.parse(url));
  //   if(response.statusCode == 200)
  //   {
  //     List<dynamic> items = json.decode(response.body)['products'];
  //
  //     return product = items;
  //
  //   }
  // }

  // List<Product> products = [];
  // Future<List<Product>> fetchProduct() async {
  //   final response = await http
  //       .get(Uri.parse("https://dummyjson.com/products"));
  //
  //   if (response.statusCode == 200) {
  //
  //     return product = Product.fromJson(jsonDecode(response.body)) as List<Product>;
  //
  //   } else {
  //
  //     throw Exception('Failed to load album');
  //   }
  // }

  List images = [];
  List<Product>? product;
  fetchdataProduct() async {
    var url = "https://dummyjson.com/products";
     var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> items = json.decode(response.body)['products'] ;
       product = items.map((tagJson) => Product.fromJson(tagJson)).toList();
      for(int i = 0; i < product!.length; i++){
        print(product!.first.images);
       emit(ShopSeccessState());
      }

      return product;
    }
  }



}







