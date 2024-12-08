import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm_app/data/model/product/product_model.dart';
import 'package:e_comm_app/utils/string_constants.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  var db = FirebaseFirestore.instance;
  @override
  Future<List<ProductModel>> getProducts() async {
    var querySnapShot = await db.collection(productsCollection).get();
    return querySnapShot.docs
        .map((e) => ProductModel.fromJson(e.data()))
        .toList();
  }
}
