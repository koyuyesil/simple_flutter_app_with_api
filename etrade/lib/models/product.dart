class Product {
  late int id;
  late int categoryId;
  late String productName;
  late String quantityPerUnit;
  late double unitPrice;
  late int unitsInStock;

  Product(this.id, this.categoryId, this.productName, this.quantityPerUnit,
      this.unitPrice, this.unitsInStock);

  Product.fromJson(Map json) {
    id = json["id"];
    categoryId = json["categoryId"];
    productName = json["productName"];
    quantityPerUnit = json["quantityPerUnit"];
    unitPrice = json["unitPrice"];
    unitsInStock = json["unitsInStock"];
  }
  Map toJson() {
    return {
      "id": 1,
      "categoryId": 2,
      "productName": "Chai",
      "quantityPerUnit": "48 - 6 oz jars",
      "unitPrice": "24",
      "unitsInStock": 53
    };
  }
}
