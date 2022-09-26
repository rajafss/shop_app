
class CategoriesModel
{
  late bool status;
 late CategoriesDataModel data;

 CategoriesModel.fromJson(Map<String,dynamic> json)
 {
   status = json['status'];
   data = CategoriesDataModel.fromJson(json['data']);
 }
}

class CategoriesDataModel
{
  late  List<BannerModel> banners;
  late  List<ProductModel> products;

  CategoriesDataModel({required this.banners, required this.products});

  factory CategoriesDataModel.fromJson(Map<String,dynamic> json)
  {
    var list = json['banners'] as List;
    List<BannerModel> bannerList = list.map((i) => BannerModel.fromJson(i)).toList();
    var listprod = json['products'] as List;
    List<ProductModel> productList = listprod.map((i) => ProductModel.fromJson(i)).toList();

    return CategoriesDataModel(
      banners: bannerList,
      products: productList,
    );

    // json['banners'].forEach((element)
     //  {
     //    banners.add(element);
     //  });

    // json['products'].forEach((element)
    // {
    //   products.add(element);
    // });
  }
}

class BannerModel
{
  late int id ;
  late String image;

  BannerModel({required this.id, required this.image});

 factory BannerModel.fromJson(Map<String,dynamic> json)
  {
   return  BannerModel(
       id : json['id'],
       image : json['image']
   );


  }
}
//
// class BannerList
// {
//  late List<BannerModel> bannersL;
//
//  BannerList({
//    required this.bannersL,
//  });
//
//
//  factory BannerList.fromJson(List<dynamic> parsedJson) {
//    List<BannerModel> bannerList = <BannerModel>[];
//    bannerList = parsedJson.map((i)=>BannerModel.fromJson(i)).toList();
//    return BannerList(
//      bannersL: bannerList,
//    );
//  }
//
// }
//
class ProductModel
{
  late int id;
  late dynamic price;
  late dynamic discount;
  late dynamic oldPrice;
  late String image;
  late String name;
  late bool inFavorite;
  late bool inCart;

  ProductModel({required this.id,
    required this.price,
    required this.discount,
    required this.oldPrice,
    required this.image,
    required this.name,
    required this.inFavorite,
    required this.inCart
  });

  factory ProductModel.fromJson(Map<String, dynamic> json)
  {
    return ProductModel(
      id : json['id'],
      price : json['price'],
      discount : json['discount'],
      oldPrice : json['old_price'],
      image : json['image'],
      name : json['name'],
      inFavorite : json['in_favorites'],
      inCart : json['in_cart'],
    );
  }

}
//
//
// class ProductsList
// {
//   late List<ProductModel> products;
//   ProductsList({
//     required this.products,
//   });
//
//
//   factory ProductsList.fromJson(List<dynamic> parsedJson) {
//     List<ProductModel> productList = <ProductModel>[];
//     productList = parsedJson.map((i)=>ProductModel.fromJson(i)).toList();
//     return ProductsList(
//       products: productList,
//     );
//   }
//
// }