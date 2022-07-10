class Category {
  late int id;
  late String categoryName;
  late String seoUrl;

  Category(this.id, this.categoryName, this.seoUrl);
  Category.fromJson(Map json) {
    id = json["id"];
    categoryName = json["categoryName"];
    seoUrl = json["seoUrl"];
  }
  Map toJson() {
    return {
      "id": this.id,
      "categoryName": this.categoryName,
      "seoUrl": this.seoUrl
    };
  }
}
