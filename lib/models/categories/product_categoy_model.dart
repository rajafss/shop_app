class ProductCategories
{
  late bool status;
 late ProductCategoriesDataModel data;

  ProductCategories.fromJson(Map<String,dynamic> json)
  {
    status = json['status'];
    data = ProductCategoriesDataModel.fromJson(json['data']);
  }
}

class ProductCategoriesDataModel
{
  late int currentPage;
 late List<CategoriesData> categories;
 ProductCategoriesDataModel({required this.currentPage,required this.categories});

 factory ProductCategoriesDataModel.fromJson(Map<String, dynamic> json)
 {
   var list = json['data'] as List;
   List<CategoriesData> categoriesList = list.map((i) => CategoriesData.fromJson(i)).toList();
   return ProductCategoriesDataModel(
     currentPage: json['current_page'],
       categories: categoriesList
   );
 }
}

class CategoriesData
{
late int id;
late String name;
late String image;

CategoriesData({required this.id, required this.name, required this.image});

factory CategoriesData.fromJson(Map<String, dynamic> json)
{
  return CategoriesData(
      id: json['id'],
      name: json['name'],
      image: json['image']
  );
}

}