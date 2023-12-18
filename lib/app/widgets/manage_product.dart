import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

import '../data/models/my_config.dart';

class ManageProduct extends StatelessWidget {
  const ManageProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Text(
              "Mặt hàng",
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
            Form(
              child: Column(
                children: [
                  MultiSelectDropDown(
                    onOptionSelected:
                        (List<ValueItem> selectedOptions) {},
                    options: const <ValueItem>[
                      ValueItem(label: 'Option 1', value: 1),
                      ValueItem(label: 'Option 2', value: 2),
                      ValueItem(label: 'Option 3', value: 3),
                      ValueItem(label: 'Option 4', value: 4),
                      ValueItem(label: 'Option 5', value: 5),
                      ValueItem(label: 'Option 6', value: 6),
                    ],
                    hint: "Chọn mặt hàng",
                    searchEnabled: true,
                    selectionType: SelectionType.single,
                    chipConfig:
                        const ChipConfig(wrapType: WrapType.wrap),
                    dropdownHeight: 300,
                    optionTextStyle: const TextStyle(fontSize: 16),
                    selectedOptionIcon:
                        const Icon(Icons.check_circle),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      showCheckboxColumn: false,
                      columns: const [
                        DataColumn(label: Text('Mã SP')),
                        DataColumn(label: Text('Tên sản phẩm')),
                        DataColumn(label: Text('Số lượng')),
                        DataColumn(label: Text('Hàng KM')),
                        DataColumn(label: Text('Giá gốc')),
                        DataColumn(label: Text('Chiết khấu')),
                        DataColumn(label: Text('Giá bán')),
                        DataColumn(label: Text('Thành tiền')),
                      ],
                      rows: [
                        DataRow(
                          cells: const [
                            DataCell(Text('SP001')),
                            DataCell(Text('Sản phẩm 1')),
                            DataCell(Text('10')),
                            DataCell(Text('Không')),
                            DataCell(Text('100,000')),
                            DataCell(Text('10%')),
                            DataCell(Text('90,000')),
                            DataCell(Text('900,000')),
                          ],
                          onLongPress: () {
                            print("long press");
                          },
                          onSelectChanged: (value) {
                            print('tap');
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 36,
            ),
          ],
        ),
      ),
    );
  }
}
