import 'package:get/get.dart';
import '../data/services_api/data_list_service.dart';

class DiscountController extends GetxController {
  final dataListService = Get.put(DataListService());
  final RxList<dynamic> discounts = <dynamic>[].obs;
}
