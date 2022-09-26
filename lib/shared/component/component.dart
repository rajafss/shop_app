import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:shopapp/Layout/cubit/cubit.dart';
import 'package:shopapp/models/favorite/favorite_model.dart';
import 'package:shopapp/module/categories/cubit/cubit.dart';
import 'package:shopapp/module/favorite/favorite_screen.dart';
import 'package:shopapp/shared/style/color.dart';

import '../../models/product_model/product.dart';
import '../../module/product_detailes/product_detailes_screen.dart';
void navigateAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context)=>
            widget),
            (router)
        {
          return false;
        }
    );


void navigateTo(context, widget) => Navigator.push(context, MaterialPageRoute(builder: (context)=> widget));


Widget articlBuilder(list, context,{bool isSearch = false}) => SingleChildScrollView(

  child:   Padding(
    padding: const EdgeInsets.all(8.0),
    child:   Column(
      children: [
        ConditionalBuilder(
          condition: ShopCubit.get(context).product != null,
          builder: (context) {
          return  Column(
              children: [
                CarouselSlider(

                    items: [
                      Image(image: AssetImage('assets/images/iphone.jpg'),
                        width: double.infinity,
                        height: 120.0,
                        fit: BoxFit.cover,),
                      Image(image: AssetImage('assets/images/mac.png'),
                        width: double.infinity,
                        height: 120.0,
                        fit: BoxFit.cover,),
                      Image(image: AssetImage('assets/images/mic.jpg'),
                        width: double.infinity,
                        height: 120.0,
                        fit: BoxFit.cover,),
                      Image(image: AssetImage('assets/images/parfum.jpg'),
                        width: double.infinity,
                        height: 120.0,
                        fit: BoxFit.cover,),


                    ],
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

                    )),

                SizedBox(height: 20,),
                ListView.separated(
                    shrinkWrap: true,
                    // color scrol
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {

                      return buildArticlesItem(list[index], context);
                 },

                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: list.length),
              ],
            );
          },
          fallback: (context)=> isSearch ? Container() : Center(child: CircularProgressIndicator()),

        ),

      ],

    ),
  ),
);

// Widget sliderBuilder(Product article, index) => CarouselSlider(
//
//     items: article.images.map((e) => Image(
//     image: NetworkImage('${e}'))
//
//     ).toList(),
//     options: CarouselOptions(
//       height: 200.0,
//       initialPage: 0,
//
//       enableInfiniteScroll: true,
//       reverse: false,
//       autoPlay: true,
//       autoPlayInterval: Duration(seconds: 3),
//       autoPlayAnimationDuration: Duration(seconds: 1),
//       autoPlayCurve: Curves.fastOutSlowIn,
//       scrollDirection: Axis.horizontal,
//
//     ));
Widget buildArticlesItem(Product article, context) =>InkWell(
  onTap: (){

    navigateTo(context, ProductDetaileScreen(product: article,));
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Stack(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('${article.image}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            IconButton(
              padding: EdgeInsetsDirectional.fromSTEB(90, 90, 0.0, 5.0),
              onPressed: (){
                navigateTo(context, FavoriteScreen());
              },
              icon: Icon(Icons.favorite_outline),color: Colors.grey,),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${article.title}',
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                ),
                Row(
                  children: [
                    Text(
                        '${article.price} \$',
                        style: TextStyle(
                          color: Colors.pink.shade700,

                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis
                    ),
                    SizedBox(
                      width: 11.0,
                    ),
                    Text('${article.brand}',
                        style: TextStyle(
                          color: Colors.pink.shade700,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis
                    ),
                  ],
                ),
                Text(
                    '${article.description}',
                    style: TextStyle(
                      color: Colors.grey,

                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis
                ),

              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

// GridView.count(
//   crossAxisCount: 2,
//   mainAxisSpacing: 10.0,
//   crossAxisSpacing: 10.0,
//   shrinkWrap: true,
//   children: List.generate(article., (index) => null),
// );





Widget myDivider() =>  Container(
  height: 2,
  margin: EdgeInsets.only(
      top: 5, right:10),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5.0),
    color: Colors.white12,
  ),
);



Widget buildeFavItem(model, context,{bool isOldPrice = true}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(
                      '${model!.image}'),
                  width: 120.0,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                if (model.discount != 0 && isOldPrice)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    color: Colors.red,
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(fontSize: 10.0, color: Colors.white),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 20.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        '${model.price}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: defaultColor,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      // if(model.discount != 0)
                      Text(
                        '${model.oldPrice}',
                        style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          ShopCategoryCubit.get(context).changeFavorite(model.id!);

                        },
                        icon: CircleAvatar(
                            radius: 15.0,
                            backgroundColor:
                            ShopCategoryCubit.get(context).favorites[model.id]!
                                ? Colors.grey
                                : defaultColor,
                            child: Icon(
                              Icons.favorite_border,
                              size: 16.0,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );