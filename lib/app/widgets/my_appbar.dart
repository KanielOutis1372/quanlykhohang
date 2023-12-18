import 'package:flutter/material.dart';
import 'package:quanlykhohang/app/data/models/my_config.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Ứng dụng quản lý kho hàng",),
      backgroundColor: MyConfig.PRIMARY_COLOR,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
