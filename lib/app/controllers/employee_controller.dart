import 'package:get/get.dart';

import '../data/models/employee_model.dart';
import '../data/services_api/data_list_service.dart';

class EmployeeController extends GetxController {
  final dataListService = Get.put(DataListService());
  final RxList<Employee> employees = <Employee>[].obs;
}