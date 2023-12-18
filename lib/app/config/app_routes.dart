// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:quanlykhohang/app/pages/export_product_excel_page.dart';

import '../pages/pages_export.dart';

class AppRoutes {
  ///root page
  static const String home = "/home";
  static const String login = "/login";

  //product group
  static const String add_product_group = "/add_product_group";
  static const String list_product_groups = "/list_product_groups";

  //product
  static const String add_product = "/add_product";
  static const String list_product = "/list_product";
  static const String import_product = "/import_product";
  static const String import_product_excel = "/import_product_excel";
  static const String export_product_excel = "/export_product_excel";

  //warehouse
  static const String warehouse_list = "/list_warehouse";
  static const String transfer_warehouse = "/transfer_warehouse";

  //salary
  static const String salary = "/salary";

  //discount
  static const String discount = "/discount";
  static const String entry_form = "/entry_form";
  static const String sales_order = "/sales_order";
  static const String sell = "/sell";

  //employee
  static const String employee = "/employee";

  ///pages map
  static final List<GetPage> getPages = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: add_product, page: () => const AddProductPage()),
    GetPage(name: list_product, page: () => const ListProductPage()),
    GetPage(name: warehouse_list, page: () => const WareHouseListPage()),
    GetPage(name: add_product_group, page: () => const AddProductGroupsPage()),
    GetPage(name: add_product_group, page: () => const AddProductGroupsPage()),
    GetPage(name: import_product, page: () => ImportProductPage()),
    GetPage(name: import_product_excel, page: () => ImportProductExcelPage()),
    GetPage(name: export_product_excel, page: () => const ExportProductExcelPage()),
    GetPage(name: employee, page: () => const EmployeePage()),
    GetPage(
        name: transfer_warehouse, page: () => const TransferWareHousePage()),
    GetPage(name: salary, page: () => const SalaryPage()),
    GetPage(name: discount, page: () => DiscountPage()),
    GetPage(name: entry_form, page: () => EntryFormPage()),
    GetPage(name: sales_order, page: () => SalesOrderPage()),
    GetPage(name: sell, page: () => const SellPage()),
    GetPage(
        name: list_product_groups, page: () => const ListProductGroupsPage()),
  ];
}
