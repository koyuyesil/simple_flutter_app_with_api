import 'package:http/http.dart' as http;

// const String host = "localhost"; //windows app
const String host = "10.0.2.2"; //host ip for emulator

class ProductApi {
  static Future getProducts() {
    return http.get(Uri.parse("http://$host:3000/products"));
  }

  static Future getProductById(int id) {
    return http.get(Uri.parse("http://$host:3000/products/$id"));
  }

  static Future getProductsByCategoryId(int id) {
    return http.get(Uri.parse("http://$host:3000/products?categoryId=$id"));
  }
}
