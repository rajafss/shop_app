import 'package:flutter/material.dart';
import 'package:shopapp/models/favorite/favorite_model.dart';
import 'package:shopapp/module/categories/cubit/cubit.dart';
import 'package:shopapp/module/categories/cubit/state.dart';
import 'package:shopapp/shared/component/component.dart';
import 'package:shopapp/shared/style/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCategoryCubit, ShopCategoriesState>(
      listener: (context, state) {},
      builder: (context, state) =>
          ConditionalBuilder(
            condition: state is! ShopLoadingChangeFavoritesState,
            builder: (context)=> ListView.separated(
                itemBuilder: (context, index) => buildeFavItem(ShopCategoryCubit.get(context).favoriteModel!.data!.data![index].product, context, isOldPrice: true),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: ShopCategoryCubit.get(context).favoriteModel!.data!.data!.length
            ),
            fallback: (BuildContext context) => Center(child:  CircularProgressIndicator(),),
          ),
    );
  }



}