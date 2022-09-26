class Product
{
  late int id;
  late String title;
  late String description;
  late dynamic price;
  late dynamic discountPercentage;
  late int stock ;
  late String brand;
  late String category;
  late String image;
  late List<String> images;

  Product({required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.stock,
    required this.brand,
    required this.category,
    required this.image,
    required this.images
  });

  factory Product.fromJson( Map<String,dynamic> json){
    var imageFromJson  = json['images'];
    List<String> imageList = imageFromJson.cast<String>();

    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      discountPercentage: json['discountPercentage'],
      stock: json['stock'],
      brand: json['brand'],
      category: json['category'],
      image: json['thumbnail'],
      images: imageList,
    );






  }

}

class Images{
  String images;
  Images(this.images);

}
class ProductList {
  final List<Product> product;

  ProductList({
    required this.product,
  });


  factory ProductList.fromJson(List<dynamic> parsedJson) {
    List<Product> product = <Product>[];
    product = parsedJson.map((i)=>Product.fromJson(i)).toList();
    return ProductList(
      product: product,
    );
  }
}