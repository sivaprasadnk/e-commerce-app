import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm_app/data/model/product/product_model.dart';
import 'package:e_comm_app/data/model/user/user_model.dart';
import 'package:e_comm_app/utils/string_constants.dart';

abstract class UserRemoteDataSource {
  Future addToWishList(ProductModel product, String userId);
  Future addToDatabase(UserModel user);
  Future<List<ProductModel>> getWishListProducts(UserModel user);
  Future removeFromWishList(ProductModel product, String userId);
  Future<bool> checkIfWishListed(ProductModel product, String userId);
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  var db = FirebaseFirestore.instance;

  @override
  Future addToWishList(ProductModel product, String userId) async {
    await db
        .collection(usersCollection)
        .doc(userId)
        .collection(wishListCollection)
        .doc(product.sku)
        .set(product.toJson());
  }

  @override
  Future addToDatabase(UserModel user) async {
    return await db.collection(usersCollection).doc(user.userId).set({
      'email': user.email,
      'userId': user.userId,
    });
  }

  @override
  Future<List<ProductModel>> getWishListProducts(UserModel user) async {
    var querySnapShot = await db
        .collection(usersCollection)
        .doc(user.userId)
        .collection(wishListCollection)
        .get();
    return querySnapShot.docs
        .map((e) => ProductModel.fromJson(e.data()))
        .toList();
  }

  @override
  Future removeFromWishList(ProductModel product, String userId) async {
    return await db
        .collection(usersCollection)
        .doc(userId)
        .collection(wishListCollection)
        .doc(product.sku)
        .delete();
  }

  @override
  Future<bool> checkIfWishListed(ProductModel product, String userId) async {
    DocumentSnapshot doc = await db
        .collection(usersCollection)
        .doc(userId)
        .collection(wishListCollection)
        .doc(product.sku)
        .get();
    return doc.exists;
  }
}
