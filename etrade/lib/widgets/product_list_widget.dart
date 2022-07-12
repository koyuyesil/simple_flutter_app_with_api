import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductListWidget extends StatefulWidget {
  List<Product> products = <Product>[];
  ProductListWidget(this.products); //bodyless constructor

  @override
  State<StatefulWidget> createState() {
    return ProductListWidgetState();
  }
}

class ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context); //widget türünde generic method
  }

  Widget buildProductList(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 500,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(widget.products.length, (index) {
              return ProductListRowWidget(widget.products[index]);
            }),
          ),
        ),
      ],
    );
  }
}
