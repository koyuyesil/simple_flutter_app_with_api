import 'package:http/http.dart' as http;

// const String host = "localhost"; //windows app
const String host = "10.0.2.2"; //host ip for emulator

class CategoryApi {
  static Future getCategories() {
    return http.get(Uri.parse("http://$host:3000/categories"));
  }

  static Future getCategoryById(int id) {
    return http.get(Uri.parse("http://$host:3000/categories/$id"));
  }
}
