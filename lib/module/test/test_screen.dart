//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// class TestScreen extends StatefulWidget {
//
//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }
//
// class _TestScreenState extends State<TestScreen> {
//   // List<dynamic> product = [];
//   // ProductList? list ;
//   fetchdataProduct() async {
//     var url = "https://dummyjson.com/products";
//     var response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       List<dynamic> items = json.decode(response.body)['products'] ;
//       List<Product> product = items.map((tagJson) => Product.fromJson(tagJson)).toList();
//       for(int i = 0; i < items.length; i++){
//
//         print(product[i].title);
//       }
//
//       return product;
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: TextButton(onPressed: ()
//       {
//         setState(() {
//           fetchdataProduct();
//         });
//       },
//           child: Text('get data')),
//     );
//   }
// }



// class Product
// {
//   late int id;
//   late String title;
//   late String description;
//   late dynamic price;
//   late dynamic discountPercentage;
//   late int stock ;
//   late String brand;
//   late String category;
//   late String image;
//
//   Product({required this.id,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.discountPercentage,
//     required this.stock,
//     required this.brand,
//     required this.category,
//     required this.image
//   });
//
//   factory Product.fromJson( Map<String,dynamic> json){
//     return Product(
//         id: json['id'],
//         title: json['title'],
//         description: json['description'],
//         price: json['price'],
//         discountPercentage: json['discountPercentage'],
//         stock: json['stock'],
//         brand: json['brand'],
//         category: json['category'],
//         image: json['thumbnail'],
//     );
//
//
//
//
//
//
//   }
//
// }
//
//
// class ProductList {
//   final List<Product> product;
//
//   ProductList({
//     required this.product,
//   });
//
//
//   factory ProductList.fromJson(List<dynamic> parsedJson) {
//
//     List<Product> products = <Product>[];
//     products = parsedJson.map((i)=>Product.fromJson(i)).toList();
//     return ProductList(
//       product: products,
//     );
//   }
// }