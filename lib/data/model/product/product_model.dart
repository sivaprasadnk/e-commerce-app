class ProductModel {
  String name;
  String imageUrl;
  String price;
  ProductModel({
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      imageUrl: json['imageUrl'],
      name: json['name'],
      price: json['price'],
    );
  }
}
