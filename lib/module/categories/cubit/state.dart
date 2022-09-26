
import 'package:shopapp/models/users/user_model.dart';


abstract class ShopCategoriesState{}

class ShopCategorieInitialState extends ShopCategoriesState{}

class ShopLoadingState extends ShopCategoriesState{}
/// all products
class ShopSuccessCategoriesState extends ShopCategoriesState{

}

class ShopErrorCategoriesState extends ShopCategoriesState{

  final String error;

  ShopErrorCategoriesState(this.error);

}

///categories
class ShopSuccessCategoriesProductState extends ShopCategoriesState{}

class ShopErrorCategoriesProductState extends ShopCategoriesState{

  final String error;

  ShopErrorCategoriesProductState(this.error);

}

/// change Favorite
class ShopChangeFavoritesState extends ShopCategoriesState{}
class ShopSuccessChangeFavoritesState extends ShopCategoriesState{}
class ShopLoadingChangeFavoritesState extends ShopCategoriesState{}

class ShopErrorChangeFavoritesState extends ShopCategoriesState{

  final String error;

  ShopErrorChangeFavoritesState(this.error);

}


/// get favorites
class ShopSuccessFavoritesState extends ShopCategoriesState{}

class ShopErrorFavoritesState extends ShopCategoriesState{

  final String error;

  ShopErrorFavoritesState(this.error);

}


/// Profile


class ShopLoadingProfile extends ShopCategoriesState{}

class ShopSuccessProfile extends ShopCategoriesState
{
  ShopUserModel? userModel;
  ShopSuccessProfile(this.userModel);

}

class ShopErrorProfile extends ShopCategoriesState
{
  final error;

  ShopErrorProfile(this.error);

}

/// update profile states

class ShopLoadingUpdateProfile extends ShopCategoriesState{}

class ShopSuccessUpdateProfile extends ShopCategoriesState
{
  ShopUserModel? userModel;
  ShopSuccessUpdateProfile(this.userModel);

}

class ShopErrorUpdateProfile extends ShopCategoriesState
{
  final error;

  ShopErrorUpdateProfile(this.error);

}