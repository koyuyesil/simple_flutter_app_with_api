import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  Product product;

  ProductListRowWidget(this.product);
  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(context) {
    return InkWell(
        child: Card(
            child: Column(
      children: <Widget>[
        Container(
          child: Image.network(
              "http://tranime.net/images/content/fansub/video/furigana.jpg"),
          height: 130.0,
          width: MediaQuery.of(context).size.width / 2,
        ),
        Text(product.productName),
        Text(product.unitPrice.toString() + " TL",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.red)),
        Text("Stok :${product.unitsInStock.toString()} Adet",
            style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    )));
  }
}
