
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/models/categories/categories_models.dart';
import 'package:shopapp/models/categories/product_categoy_model.dart';
import 'package:shopapp/module/categories/cubit/cubit.dart';
import 'package:shopapp/shared/component/component.dart';
import 'package:shopapp/shared/style/color.dart';

import 'cubit/state.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';


class CategorieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCategoryCubit,ShopCategoriesState>(
      listener: (context, state){},
      builder: (context,state) {
        return ConditionalBuilder(
          condition: ShopCategoryCubit
              .get(context)
              .productHome != null && ShopCategoryCubit.get(context).productCategories != null,
          builder: (BuildContext context) => ProductBuilder(ShopCategoryCubit.get(context).productHome,
              ShopCategoryCubit.get(context).productCategories, context),
          fallback: (BuildContext context) =>
              Center(child: CircularProgressIndicator(),),

        );
      }
    );
  }

  Widget ProductBuilder(CategoriesModel? homeCategory, ProductCategories? categoriesModel, context)=> SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
            items: homeCategory!.data.banners.map((e) => Image(
                image: NetworkImage('${e.image}'),
            fit: BoxFit.cover,
              width: double.infinity,)

            ).toList(),
            options: CarouselOptions(
              height: 200.0,
              initialPage: 0,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,

            )
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index)=> categoriesItem(categoriesModel!.data.categories[index]),
                    separatorBuilder: (context, index)=> SizedBox(width: 10.0,),
                    itemCount: categoriesModel!.data.categories.length
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('New Products',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          child: GridView.count(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
              /// aspectration
              childAspectRatio: 1/1.58,
              children: List.generate(
                  homeCategory.data.products.length,
                      (index) => productList( homeCategory.data.products[index], context),
              ),
          ),
        ),
      ],
    ),
  );
}

Widget categoriesItem(CategoriesData categoriesData) => Stack(
  alignment: AlignmentDirectional.bottomCenter,
  children: [
    Image(image: NetworkImage(categoriesData.image),
      height: 150.0,
      width: 150.0,
      fit: BoxFit.cover,
    ),
    Container(
      color: Colors.black.withOpacity(.8),
      width: 150.0,
      child:  Text(categoriesData.name,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.white,
            fontSize: 18),
      ),

    ),
  ],
);
Widget productList( ProductModel model, context) => Container(
      color: Colors.white,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Image(image: NetworkImage(model.image),
          width: double.infinity,
          height: 180,
          ),
          if(model.discount != 0)
            Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            color: Colors.red,
            child: Text('DISCOUNT',
              style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.white
              ),),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 14.0,
            ),),
            Row(
              children: [
                Text('${model.price}',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: defaultColor,
                  ),),
                SizedBox(
                  width: 5.0,
                ),
                // if(model.discount != 0)
                  Text('${model.oldPrice}',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough
                  ),),
                Spacer(),
                IconButton(
                  onPressed: ()
                  {
                    ShopCategoryCubit.get(context).changeFavorite(model.id);
                    print(model.id);
                  },

                  icon: CircleAvatar(
                    radius: 15.0,
                      backgroundColor: ShopCategoryCubit.get(context).favorites[model.id]! ? Colors.grey : defaultColor ,
                      child: Icon(
                        Icons.favorite_border,
                        size: 16.0,
                      color: Colors.white,
                      )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
  ],
),
    );
