import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        "title": title,
        "description": description,
        "image": image,
        "category": category
      },
    );
    return ProductModel.fromJson(data);
  }
}
