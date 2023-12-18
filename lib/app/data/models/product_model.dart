class Product {
  int? id;
  String? name;
  String? code;
  int? buyPrice;
  int? salePrice;
  String? color;
  int? stock;
  int? active;
  String? productGroupsName;
  String? sellQuality;
  String? purchaseQuality;

  Product(
      {this.id,
      this.name,
      this.code,
      this.buyPrice,
      this.salePrice,
      this.color,
      this.stock,
      this.active,
      this.productGroupsName,
      this.sellQuality,
      this.purchaseQuality});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    buyPrice = json['buy_price'];
    salePrice = json['sale_price'];
    color = json['color'];
    stock = json['stock'];
    active = json['active'];
    productGroupsName = json['product_groups_name'];
    sellQuality = json['sell_quality'];
    purchaseQuality = json['purchase_quality'];
  }
}
