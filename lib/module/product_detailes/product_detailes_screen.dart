
import 'dart:convert';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../Layout/cubit/cubit.dart';
import '../../models/product_model/product.dart';




class ProductDetaileScreen extends StatelessWidget {
 final Product product;
 ProductDetaileScreen({required this.product});

  @override
  Widget build(BuildContext context) {
void getImages()
{
  for(int i = 0; i< product.images.length; i++)
  {
    print(product.images[i]);
  }
}

    return  Scaffold(
          appBar: AppBar(
            title: Text("${product.category}", style: Theme.of(context).textTheme.bodyText1),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage('${product.image}',),
                        fit: BoxFit.cover,

                      ),
                    ),

                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                 Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${product.title}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                              '${product.price} \$',
                              style: TextStyle(
                                color: Colors.pink.shade700,

                              ),

                          ),
                          Text(
                              '${product.description}',
                              style: TextStyle(
                                color: Colors.grey,

                              ),

                          ),
                          Text('${product.brand}',
                            style: TextStyle(
                            color: Colors.pink.shade700,
                          ),

                          ),
                        ],
                      ),
                    ),

                CarouselSlider(

                              items: product.images.map((e) => Image(
                                  image: NetworkImage('${e}'))

                              ).toList(),
                              options: CarouselOptions(
                                height: 300.0,
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


                  Container(
                    color: Colors.pink.shade700,
                    child: Text('${product.stock} Stock',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.white)),
                  ),

                ],
              ),
            ),
          ),

        );
      }
}
