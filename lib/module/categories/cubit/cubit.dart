
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Layout/cubit/states.dart';
import 'package:shopapp/models/categories/categories_models.dart';
import 'package:shopapp/models/categories/product_categoy_model.dart';
import 'package:shopapp/models/favorite/change_favorite_model.dart';
import 'package:shopapp/models/favorite/favorite_model.dart';
import 'package:shopapp/models/users/user_model.dart';
import 'package:shopapp/module/categories/cubit/state.dart';
import 'package:http/http.dart' as http;
import 'package:shopapp/network/remote/dio_helper.dart';
import 'package:shopapp/shared/constant/constant.dart';
import 'package:shopapp/shared/router.dart';



class ShopCategoryCubit extends Cubit<ShopCategoriesState> {

  ShopCategoryCubit() : super(ShopCategorieInitialState());


  static ShopCategoryCubit get(context) => BlocProvider.of(context);

  Map<int, bool> favorites = {};
  /// get products
  CategoriesModel? productHome;
   void getProducts()
    {
      ShopDioHelper.getData(
          url: HOME
      ).then((value) {
        productHome = CategoriesModel.fromJson(value.data);
        // product = items.map((tagJson) => Product.fromJson(tagJson)).toList();
        // print(productHome!.data.products[0].name);
        print(productHome!.status);
        print(productHome!.data.banners[0].id);
        print(productHome!.data.products[0].name);
        productHome!.data.products.forEach((element)
        {
         favorites.addAll(
             {
               element.id: element.inFavorite
             }) ;
        });
             print(favorites.toString());
        emit(ShopSuccessCategoriesState());
      }).catchError((error)
      {
        print(error.toString());
        emit(ShopErrorCategoriesState(error.toString()));
      });
    }



/// get categries

  ProductCategories? productCategories;

  void getCategoriesProducts()
  {
    ShopDioHelper.getData(
        url: GET_CATEGORIES
    ).then((value) {
      productCategories = ProductCategories.fromJson(value.data);
      // product = items.map((tagJson) => Product.fromJson(tagJson)).toList();
      // print(productHome!.data.products[0].name);
      print(productCategories!.status);
      emit(ShopSuccessCategoriesProductState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopErrorCategoriesProductState(error.toString()));
    });
  }


  ///Change favorite

  ChangeFavoriteModel? changeFavoriteModel;
void changeFavorite(int productId)
{
  favorites[productId] = !favorites[productId]!;
  emit(ShopChangeFavoritesState());
  ShopDioHelper.postData(
      url: FAVORITES,
      data: {
        "product_id": productId
      },
     token: token
  ).then((value)
  {

    changeFavoriteModel = ChangeFavoriteModel.fromJson(value.data);
    print(value.data);
    if(!changeFavoriteModel!.status)
    {
      favorites[productId] = !favorites[productId]!;
    }else
    {
      getFavorites();
    }
    emit(ShopSuccessChangeFavoritesState());
  }).catchError((error){
    favorites[productId] = !favorites[productId]!;
    emit(ShopErrorChangeFavoritesState(error.toString()));
  });
}


/// get Favorites
  FavoritesModel? favoriteModel;

  void getFavorites()
  {
    emit(ShopLoadingChangeFavoritesState());
    ShopDioHelper.getData(
        url: FAVORITES,
      token: token
    ).then((value) {
      favoriteModel = FavoritesModel.fromJson(value.data);
      // product = items.map((tagJson) => Product.fromJson(tagJson)).toList();
      // print(productHome!.data.products[0].name);
      // printFullText('data : ${value.data.toString()} ');
      emit(ShopSuccessFavoritesState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopErrorFavoritesState(error.toString()));
    });
  }


  /// get Profile
  ShopUserModel? userModel;

  void getProfile()
  { emit(ShopLoadingProfile());
    ShopDioHelper.getData(
        url: 'https://student.valuxapps.com/api/profile',
        token: token
    ).then((value) {
      print('object: ${token}');
      userModel = ShopUserModel.fromJson(value.data);
      printFullText(userModel!.status.toString());
      // print(' user data : ${userModel!.data.token.toString()}');
      emit(ShopSuccessProfile(userModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopErrorProfile(error.toString()));
    });
  }

/// update profile
  void updateProfile({
  required String name,
  required String email,
    required String phone
})
  {
    emit(ShopLoadingUpdateProfile());
    ShopDioHelper.putData(
        url: UPDATE_PROFILE,
        token: token,
      data: {
          'name': name,
        'email': email,
        'phone': phone
      }
    ).then((value) {
      print('object: ${token}');
      userModel = ShopUserModel.fromJson(value.data);
      printFullText(userModel!.status.toString());
      // print(' user data : ${userModel!.data.token.toString()}');
      emit(ShopSuccessUpdateProfile(userModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopErrorUpdateProfile(error.toString()));
    });
  }
}
