import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanlykhohang/app/config/helper.dart';
import 'package:quanlykhohang/app/data/models/my_config.dart';
import 'package:quanlykhohang/app/widgets/body_home_card.dart';
import 'package:quanlykhohang/app/widgets/my_drawer.dart';
import '../controllers/home_controller.dart';
import '../widgets/my_appbar.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.9),
        appBar: const MyAppBar(),
        drawer: const MyDrawer(),
        body: Padding(
          padding: EdgeInsets.all(MyConfig.PADDING_PAGE.toDouble()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Quản lý kho",
                style: TextStyle(
                    fontSize: MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() + 3,
                    color: MyConfig.SECONDARY_COLOR,
                    fontWeight: MyConfig.semiBold),
              ),
              SizedBox(
                height: MyConfig.PADDING_PAGE.toDouble(),
              ),
              Expanded(
                child: Obx(
                  () {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.cardDatas.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemBuilder: (context, index) {
                          // Lấy key và value từ Map
                          String key =
                              controller.cardDatas.keys.elementAt(index);
                          dynamic value = controller.cardDatas[key];

                          value == null
                              ? value = 0
                              : value = Helper.formatNumberWithCommas(value);

                          dynamic name = controller.cardNames[key];

                          int flag = 0;
                          if (key == "totalOrder") {
                            flag = 1;
                          }
                          // Mã màu từ Map hoặc giá trị mặc định nếu không có
                          Color myColor = Color(int.parse(controller
                                  .cardColors[key]
                                  ?.replaceAll('#', '0xFF') ??
                              '0xFFFFFFFF'));
                          return BodyHomeCard(
                            name: name,
                            value: value,
                            myColor: myColor,
                            flag: flag,
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
