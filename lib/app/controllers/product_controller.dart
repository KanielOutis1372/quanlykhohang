import 'package:get/get.dart';
import 'package:quanlykhohang/app/config/helper.dart';
import 'package:quanlykhohang/app/data/models/product_group_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/product_model.dart';
import '../data/models/ware_house_model.dart';
import '../data/services_api/data_list_service.dart';
import '../data/services_api/url_api.dart';

class ProductController extends GetxController {
  final dataListService = Get.put(DataListService());
  final RxList<Product> products = <Product>[].obs;
  final RxList<ProductGroup> productGroups = <ProductGroup>[].obs;
  final RxList<Warehouse> wareHouses = <Warehouse>[].obs;
  final totalQuality = ''.obs;
  final totalPrice = ''.obs;

  Future<void> fetchDataAPI() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final data = await dataListService.fetchData(token, UrlAPI.productListAPI);
    if (data['products'] != null) {
      data['products'].forEach((v) {
        products.add(Product.fromJson(v));
      });
    }

    if (data['totalPrice'] != null) {
      totalPrice.value = data['totalPrice'];
      totalPrice.value =
          Helper.formatNumberWithCommas(double.parse(totalPrice.value));
    }

    if (data['totalquality'] != null) {
      totalQuality.value = data['totalquality'];
      totalQuality.value =
          Helper.formatNumberWithCommas(double.parse(totalQuality.value));
    }

    //ware house
    if (data['Warehouse'] != null) {
      data["Warehouse"].forEach((v) {
        wareHouses.add(Warehouse.fromJson(v));
      });
    }

    //product group
    if (data['ProductGroup'] != null) {
      data["ProductGroup"].forEach((v) {
        productGroups.add(ProductGroup.fromJson(v));
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchDataAPI();
  }
}
