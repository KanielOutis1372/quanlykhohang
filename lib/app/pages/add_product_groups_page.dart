import 'package:flutter/material.dart';

import '../data/models/my_config.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_drawer.dart';

class AddProductGroupsPage extends StatefulWidget {
  const AddProductGroupsPage({super.key});

  @override
  State<AddProductGroupsPage> createState() => _AddProductGroupsPageState();
}

class _AddProductGroupsPageState extends State<AddProductGroupsPage> {
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(MyConfig.PADDING_PAGE.toDouble()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Thêm nhóm hàng mới",
                  style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() + 3,
                    color: MyConfig.SECONDARY_COLOR,
                    fontWeight: MyConfig.semiBold,
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MyConfig.PADDING_PAGE.toDouble() + 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Tên nhóm hàng",
                        ),
                      ),
                      SizedBox(
                        height: MyConfig.PADDING_PAGE.toDouble() + 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Mã nhóm hàng",
                        ),
                      ),
                      SizedBox(
                        height: MyConfig.PADDING_PAGE.toDouble() + 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Công thức",
                          hintText: "Ví dụ: 8,5000",
                        ),
                      ),
                      SizedBox(
                        height: MyConfig.PADDING_PAGE.toDouble() + 20,
                      ),
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                            label: Text("Chọn cách tính")),
                        // hint: const Text("Chọn cách tính"),
                        items: ['%', 'Đơn vị (mét, cái, sản phẩm)']
                            .map((String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                        value: selectedOption,
                        onChanged: (String? value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: MyConfig.PADDING_PAGE.toDouble() + 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Số đơn vị",
                          hintText: "Ví dụ: 8,5000",
                        ),
                      ),
                      SizedBox(
                        height: MyConfig.PADDING_PAGE.toDouble() + 20,
                      ),
                      TextFormField(
                        minLines: 3,
                        maxLines: 100,
                        decoration: InputDecoration(
                          hintText: "Mô tả nhóm hàng",
                          hintStyle: TextStyle(
                              fontSize:
                                  MyConfig.SECOND_FONT_SIZE_TEXT.toDouble()),
                        ),
                      ),
                      SizedBox(
                        height: MyConfig.PADDING_PAGE.toDouble() + 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          // if (_formKey.currentState!.validate()) {
                          //   controller.login();
                          // }
                        },
                        child: const Text("Lưu nhóm hàng"),
                      ),
                    ],
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
