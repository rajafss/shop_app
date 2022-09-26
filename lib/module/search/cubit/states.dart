

abstract class ShopSearchState{}

class ShopSearchInitialState extends ShopSearchState{}

class ShopLoadingSearchState extends ShopSearchState{}

class ShopSuccessSearchState extends ShopSearchState{}


class ShopErrorSearchState extends ShopSearchState{

  final String error;

  ShopErrorSearchState(this.error);

}
