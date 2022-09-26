import 'package:flutter/material.dart';
import 'package:shopapp/models/categories/product_categoy_model.dart';
import 'package:shopapp/module/categories/cubit/cubit.dart';
import 'package:shopapp/module/categories/cubit/state.dart';
import 'package:shopapp/shared/component/component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCategoryCubit, ShopCategoriesState>(
        listener: (context,state){},
        builder: (context, state)=> ListView.separated(
            itemBuilder: (context, index) => CategoryBuilder(ShopCategoryCubit.get(context).productCategories!.data.categories[index]),
            separatorBuilder: (context,index) => myDivider(),
            itemCount: ShopCategoryCubit.get(context).productCategories!.data.categories.length),
    );
  }



  Widget CategoryBuilder(CategoriesData model) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(image: NetworkImage(model.image),
          fit: BoxFit.cover,
          height: 100,
          width: 100,),
        SizedBox(width: 20,),
        Text(model.name,
          style: TextStyle(fontSize: 20,
          fontWeight: FontWeight.w300),),
        Spacer(),
        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
      ],

    ),
  );
}
