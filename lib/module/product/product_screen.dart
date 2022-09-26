
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/Layout/cubit/cubit.dart';
import 'package:shopapp/Layout/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/component/component.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class ProductScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = ShopCubit.get(context).product;

        return articlBuilder(list,context);

      }
    );

  }
  }

// Widget articlBuilder(list) => Column(
//   children: [
//     CarouselSlider(
//
//         items: [
//           // Image(image: NetworkImage(list[context].),
//           //   width: double.infinity,
//           //   fit: BoxFit.cover,),
//           Image(image: AssetImage('assets/images/iphone.jpg'),
//             width: double.infinity,
//             fit: BoxFit.cover,),
//           Image(image: AssetImage('assets/images/parfum.jpg'),
//             width: double.infinity,
//             fit: BoxFit.cover,),
//           Image(image: AssetImage('assets/images/nass.jpg'),
//             width: double.infinity,
//             fit: BoxFit.cover,),
//
//         ],
//         options: CarouselOptions(
//           height: 200.0,
//           initialPage: 0,
//
//           enableInfiniteScroll: true,
//           reverse: false,
//           autoPlay: true,
//           autoPlayInterval: Duration(seconds: 3),
//           autoPlayAnimationDuration: Duration(seconds: 1),
//           autoPlayCurve: Curves.fastOutSlowIn,
//           scrollDirection: Axis.horizontal,
//
//         )),
//     SizedBox(height: 20,),
//     ListView.separated(
//         shrinkWrap: true,
//         // color scrol
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (context,index) => buildArticlesItem(list[index], context),
//         separatorBuilder: (context,index) => myDivider(),
//         itemCount: list.length),
//   ],
// ),