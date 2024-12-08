class ProductModel {
  String name;
  String imageUrl;
  String price;
  String description;
  String sku;
  ProductModel({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
    required this.sku,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      imageUrl: json['imageUrl'],
      name: json['name'],
      price: json['price'],
      description: json['desc'],
      sku: json['sku'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'price': price,
      'desc': description,
      'sku': sku,
    };
  }


}
