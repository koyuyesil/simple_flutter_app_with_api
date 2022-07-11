import 'package:http/http.dart' as http;

class CategoryApi {
  static Future getCategories() async {
    return await http.get(Uri.parse("http://localhost:3000/categories"));
  }

  static Future getCategoriesById(int id) async {
    return await http.get(Uri.parse("http://10.0.0.2:3000/categories?id=$id"));
  }
}
