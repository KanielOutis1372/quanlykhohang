import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanlykhohang/app/controllers/salary_controller.dart';
import '../data/models/my_config.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_drawer.dart';

class SalaryPage extends GetView<SalaryController> {
  const SalaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SalaryController());
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
                  "Lương",
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
                        Text(
                          "Bảng tính lương",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: MyConfig.bold,
                            fontSize:
                                MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() + 4,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Divider(
                          color: Colors.grey[300],
                          height: 20,
                          thickness: 0.6,
                          indent: 0,
                          endIndent: 2,
                        ),
                        const SizedBox(
                          height: 12,
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
                          height: 24,
                        ),
                        Obx(
                          () {
                            if (controller.salarys.isNotEmpty) {
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
                                    DataColumn(label: Text('Nhóm hàng')),
                                    DataColumn(label: Text('Lương')),
                                  ],
                                  sortColumnIndex: 0,
                                  sortAscending: true,
                                  source: UserDataTableSourceSalary(
                                      controller.salarys, context),
                                  // onPageChanged: (pageIndex) {},
                                  // onRowsPerPageChanged: (rowsPerPage) {},
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

class UserDataTableSourceSalary extends DataTableSource {
  final RxList<dynamic> salarys;
  final BuildContext context;
  UserDataTableSourceSalary(this.salarys, this.context);

  @override
  DataRow getRow(int index) {
    final salary = salarys[index];
    return DataRow(
      selected: false,
      cells: [
        DataCell(Text((index + 1).toString())),
        DataCell(Text((index + 1).toString())),
        DataCell(Text((index + 1).toString())),
      ],
      onSelectChanged: (_) => print(
          'Row $index tapped: ${salarys[index].id} - ${salarys[index].name} - ${salarys[index].color}'),
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
  int get rowCount => salarys.length;

  @override
  int get selectedRowCount => 0;
}
