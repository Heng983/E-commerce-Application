import 'package:ecommerce_app/model/productModel.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  Future<List<ProductModel>> readData() async {
    try {
      http.Response response = await http.get(
        Uri.parse("https://dummyjson.com/products"),
      );

      if (response.statusCode == 200) {
        return productModelFromJson(response.body);
      } else {
        throw Exception("error status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("error: ${e.toString()}");
    }
  }
}
