
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/models/search/search_model.dart';
import 'package:shopapp/module/search/cubit/states.dart';
import 'package:shopapp/network/remote/dio_helper.dart';
import 'package:shopapp/shared/constant/constant.dart';
import 'package:shopapp/shared/router.dart';

class ShopCubitSearch extends Cubit<ShopSearchState>
{
  ShopCubitSearch(): super(ShopSearchInitialState());

  static ShopCubitSearch get(context) => BlocProvider.of(context);

SearchModel? model;

void search(String text)
{
  emit(ShopLoadingSearchState());
  ShopDioHelper.postData(
      url: SEARCH,
      token: token,
      data: {
        'text': text
      }).then((value) 
  {
    model = SearchModel.fromJson(value.data);
    emit(ShopSuccessSearchState());
  }).catchError((error){
    print(error.toString());
    emit(ShopErrorSearchState(error));
  });
}
}