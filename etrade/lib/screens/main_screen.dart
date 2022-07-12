import 'dart:convert';

import 'package:etrade/data/api/category_api.dart';
import 'package:etrade/data/api/product_api.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/product.dart';
import '../widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Category> categories = <Category>[];
  List<Widget> categoryWidgets = <Widget>[];
  List<Product> products = <Product>[];

  @override
  void initState() {
    getCategoriesFromApi();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alışveriş Sistemi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
              )),
          ProductListWidget(products)
        ]),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = jsonDecode(response.body);
        this.categories = list.map((e) => Category.fromJson(e)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++)
      this.categoryWidgets.add(getCategoryWidget(categories[i]));
    return categoryWidgets; //return şimdilik kullanılmıyor.
  }

  Widget getCategoryWidget(Category category) {
    return OutlinedButton(
      onPressed: () {
        getProductsByCategoryId(category);
      },
      child: Text(category.categoryName,
          style: TextStyle(color: Colors.blueGrey, letterSpacing: 0)),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
            side: BorderSide(color: Colors.redAccent)),
        padding: EdgeInsets.all(20),
      ),
    );
  }

  void getProducts() {
    ProductApi.getProducts().then((response) {
      setState(() {
        Iterable list = jsonDecode(response.body);
        this.products =
            list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }

  void getProductsByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((response) {
      setState(() {
        Iterable list = jsonDecode(response.body);
        this.products =
            list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }
}
