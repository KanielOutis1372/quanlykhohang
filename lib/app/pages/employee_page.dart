import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanlykhohang/app/controllers/employee_controller.dart';
import 'package:quanlykhohang/app/data/models/employee_model.dart';

import '../data/models/my_config.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_drawer.dart';

class EmployeePage extends GetView<EmployeeController> {
  const EmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmployeeController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyConfig.MY_BACKGROUND_COLOR,
        appBar: const MyAppBar(),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(MyConfig.PADDING_PAGE.toDouble()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nhân viên",
                  style: TextStyle(
                      fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() + 3,
                      color: MyConfig.SECONDARY_COLOR,
                      fontWeight: MyConfig.semiBold),
                ),
                SizedBox(
                  height: MyConfig.PADDING_PAGE.toDouble(),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "Thêm nhân viên",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: MyConfig.bold,
                              fontSize:
                                  MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() +
                                      4,
                            ),
                          ),
                          subtitle: const Text("Nhập thông tin Nhân viên"),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Divider(
                          color: Colors.grey[300],
                          height: 20,
                          thickness: 0.6,
                          indent: 0,
                          endIndent: 2,
                        ),
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  label: Text(
                                    "Họ và tên",
                                    style: TextStyle(
                                        fontSize: MyConfig
                                                .PRIMARY_FONT_SIZE_TEXT
                                                .toDouble() +
                                            2),
                                  ),
                                  hintText: "Nguyễn Văn A",
                                ),
                              ),
                              const SizedBox(
                                height: 28,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  label: Text(
                                    "Địa chỉ",
                                    style: TextStyle(
                                        fontSize: MyConfig
                                                .PRIMARY_FONT_SIZE_TEXT
                                                .toDouble() +
                                            2),
                                  ),
                                  hintText: "Hà Nội",
                                ),
                              ),
                              const SizedBox(
                                height: 28,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        label: Text(
                                          "Số điện thoại",
                                          style: TextStyle(
                                              fontSize: MyConfig
                                                      .PRIMARY_FONT_SIZE_TEXT
                                                      .toDouble() +
                                                  2),
                                        ),
                                        hintText: "0324637459",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        label: Text(
                                          "Công nợ",
                                          style: TextStyle(
                                              fontSize: MyConfig
                                                      .PRIMARY_FONT_SIZE_TEXT
                                                      .toDouble() +
                                                  2),
                                        ),
                                        hintText: "0",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 44,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .all<Color>(MyConfig
                                            .PRIMARY_COLOR), // Màu nền khi không được nhấn
                                    overlayColor:
                                        MaterialStateProperty.all<Color>(Colors
                                            .grey), // Màu nền khi được nhấn
                                    // Các thuộc tính khác của ButtonStyle
                                  ),
                                  child: Text(
                                    "Lưu Nhân Viên",
                                    style: TextStyle(
                                      fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT
                                          .toDouble(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            "Danh sách nhân viên",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: MyConfig.bold,
                              fontSize:
                                  MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() +
                                      4,
                            ),
                          ),
                          subtitle: const Text("Thông tin các nhân viên"),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Divider(
                          color: Colors.grey[300],
                          height: 20,
                          thickness: 0.6,
                          indent: 0,
                          endIndent: 2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 150),
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                const Icon(Icons.arrow_downward),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "XUẤT FILE",
                                  style: TextStyle(
                                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT
                                        .toDouble(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: 'Tìm kiếm',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () {
                            if (controller.employees.isNotEmpty) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: PaginatedDataTable(
                                  columns: const [
                                    DataColumn(label: Text('STT')),
                                    DataColumn(label: Text('Họ tên')),
                                    DataColumn(label: Text('Địa chỉ')),
                                    DataColumn(label: Text('Số điện thoại')),
                                    DataColumn(label: Text('Công nợ')),
                                    DataColumn(label: Text('Trạng thái')),
                                  ],
                                  sortColumnIndex: 0,
                                  sortAscending: true,
                                  source: UserDataTableSourcEmployee(
                                      controller.employees, context),
                                  showCheckboxColumn: false,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserDataTableSourcEmployee extends DataTableSource {
  final RxList<Employee> employees;
  final BuildContext context;
  UserDataTableSourcEmployee(this.employees, this.context);

  @override
  DataRow getRow(int index) {
    final employee = employees[index];
    return DataRow(
      selected: false,
      cells: [
        DataCell(Text((index + 1).toString())),
        DataCell(Text((index + 1).toString())),
        DataCell(Text((index + 1).toString())),
        DataCell(Text((index + 1).toString())),
        DataCell(Text((index + 1).toString())),
        DataCell(Text((index + 1).toString())),
      ],
      onSelectChanged: (_) => print('Row $index tapped: '),
      onLongPress: () => showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => AlertDialog(
          actions: [
            TextButton(onPressed: () {}, child: const Text("Cancel")),
            TextButton(onPressed: () {}, child: const Text("Ok"))
          ],
          title: const Text("Are you sure delete this?"),
        ),
      ),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => employees.length;

  @override
  int get selectedRowCount => 0;
}
