import 'package:flutter/material.dart';

import '../data/models/my_config.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_drawer.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
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
                  "Thêm hàng hóa",
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
                          labelText: "Tên mặt hàng",
                        ),
                      ),
                      SizedBox(
                        height: MyConfig.PADDING_PAGE.toDouble() + 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Mã mặt hàng",
                        ),
                      ),
                      SizedBox(
                        height: MyConfig.PADDING_PAGE.toDouble() + 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Giá nhập",
                        ),
                      ),
                      SizedBox(
                        height: MyConfig.PADDING_PAGE.toDouble() + 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Giá bán",
                        ),
                      ),
                      SizedBox(
                        height: MyConfig.PADDING_PAGE.toDouble() + 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Màu sắc",
                        ),
                      ),
                      SizedBox(
                        height: MyConfig.PADDING_PAGE.toDouble() + 20,
                      ),
                      DropdownButtonFormField(
                        decoration:
                            const InputDecoration(label: Text("Chọn nhóm")),
                        // hint: const Text("Chọn cách tính"),
                        items: ['Nhóm SOPOKA', 'Hàng Vặt', 'Đá cắt', 'Kim khí']
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
                        child: const Text("Lưu sản phẩm"),
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
