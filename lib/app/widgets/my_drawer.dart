import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanlykhohang/app/config/app_routes.dart';
import 'package:quanlykhohang/app/controllers/my_drawer_controller.dart';
import 'package:quanlykhohang/app/data/models/my_config.dart';

class MyDrawer extends GetView<MyDrawerController> {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyDrawerController());
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: MyConfig.PRIMARY_COLOR),
            accountName: Obx(
              () => Text(
                controller.fullname.value,
                style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() - 2),
              ),
            ),
            accountEmail: Obx(
              () => Text(
                controller.email.value,
                style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() - 2),
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  MyConfig.URL_AVT_USER,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("Trang chủ",
                style: TextStyle(
                  fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                  fontWeight: MyConfig.semiBold,
                  color: MyConfig.LIST_TILE,
                )),
            leading: Icon(
              Icons.home,
              size: MyConfig.PRIMARY_FONT_SIZE_ICON.toDouble(),
            ),
            onTap: () => Get.offNamed(AppRoutes.home),
          ),
          ExpansionTile(
            leading: const Icon(Icons.bar_chart_rounded),
            title: Text(
              "Quản lý nhóm hàng",
              style: TextStyle(
                fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                fontWeight: MyConfig.semiBold,
                color: MyConfig.LIST_TILE,
              ),
            ),
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Thêm nhóm hàng",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () => Get.offAllNamed(AppRoutes.add_product_group),
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Danh sách nhóm hàng",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () => Get.offAllNamed(AppRoutes.list_product_groups),
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.store),
            title: Text(
              "Quản lý kho hàng",
              style: TextStyle(
                fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                fontWeight: MyConfig.semiBold,
                color: MyConfig.LIST_TILE,
              ),
            ),
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Thêm hàng mới",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () => Get.offAllNamed(AppRoutes.add_product),
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Danh sách hàng",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () => Get.offAllNamed(AppRoutes.list_product),
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Danh sách kho",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () => Get.offAllNamed(AppRoutes.warehouse_list),
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Chuyển kho",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () => Get.offAllNamed(AppRoutes.transfer_warehouse),
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Tính lương",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () => Get.offAllNamed(AppRoutes.salary),
              ),
            ],
          ),
          ListTile(
            title: Text("Chiết khấu",
                style: TextStyle(
                  fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                  fontWeight: MyConfig.semiBold,
                  color: MyConfig.LIST_TILE,
                )),
            leading: Icon(
              Icons.money_off,
              size: MyConfig.PRIMARY_FONT_SIZE_ICON.toDouble(),
            ),
            onTap: () => Get.offAllNamed(AppRoutes.discount),
          ),
          ExpansionTile(
            leading: const Icon(Icons.compare_arrows),
            title: Text(
              "Nhập hàng",
              style: TextStyle(
                fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                fontWeight: MyConfig.semiBold,
                color: MyConfig.LIST_TILE,
              ),
            ),
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Nhập hàng",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () => Get.offAllNamed(AppRoutes.import_product),
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Nhập hàng (Excel)",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () => Get.offAllNamed(AppRoutes.import_product_excel),
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Đơn nhập",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () => Get.offAllNamed(AppRoutes.entry_form),
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.compare_arrows),
            title: Text(
              "Bán hàng",
              style: TextStyle(
                fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                fontWeight: MyConfig.semiBold,
                color: MyConfig.LIST_TILE,
              ),
            ),
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Bán hàng",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () => Get.offAllNamed(AppRoutes.sell),
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Xuất hàng (Excel)",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () => Get.offAllNamed(AppRoutes.export_product_excel),
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Đơn bán",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () => Get.offAllNamed(AppRoutes.sales_order),
              ),
            ],
          ),
          ListTile(
            title: Text("Nhân viên",
                style: TextStyle(
                  fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                  fontWeight: MyConfig.semiBold,
                  color: MyConfig.LIST_TILE,
                )),
            leading: Icon(
              Icons.star,
              size: MyConfig.PRIMARY_FONT_SIZE_ICON.toDouble(),
            ),
            onTap: () => Get.offAllNamed(AppRoutes.employee),
          ),
          ExpansionTile(
            leading: const Icon(Icons.group),
            title: Text(
              "Khách hàng",
              style: TextStyle(
                fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                fontWeight: MyConfig.semiBold,
                color: MyConfig.LIST_TILE,
              ),
            ),
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Thêm khách hàng",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Nhập khách hàng (Excel)",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Quản lý tuyến",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.ssid_chart),
            title: Text(
              "Thống kê",
              style: TextStyle(
                fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                fontWeight: MyConfig.semiBold,
                color: MyConfig.LIST_TILE,
              ),
            ),
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Báo cáo chiết khấu",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Doanh số thực",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Doanh số nhập",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Hàng bảo hành",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Đề nghị thanh toán",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Lương NVBH",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.settings),
            title: Text(
              "Cấu hình",
              style: TextStyle(
                fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                fontWeight: MyConfig.semiBold,
                color: MyConfig.LIST_TILE,
              ),
            ),
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Chỉ tiêu bán",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Chỉ tiêu nhập",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 80),
                title: Text(
                  "Thông tin NPP",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                    color: MyConfig.SUB_LIST_TILE,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 36),
            title: Text("Đăng xuất",
                style: TextStyle(
                  fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble(),
                  fontWeight: MyConfig.semiBold,
                  color: Colors.red,
                )),
            leading: Icon(
              Icons.output,
              size: MyConfig.PRIMARY_FONT_SIZE_ICON.toDouble(),
              color: Colors.red,
            ),
            onTap: () => controller.logout(),
          ),
        ],
      ),
    );
  }
}
