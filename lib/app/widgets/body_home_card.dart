// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../data/models/my_config.dart';

class BodyHomeCard extends StatelessWidget {
  BodyHomeCard({
    required this.value,
    required this.myColor,
    required this.name,
    this.flag,
    super.key,
  });

  var name, value, myColor, flag;

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        flag == 1 ? "$value Đơn" : "$value VNĐ",
                        style: TextStyle(
                          color: myColor,
                          fontSize: 26,
                          fontWeight: MyConfig.semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$name",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: MyConfig.semiBold,
                          color: MyConfig.SECONDARY_COLOR,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  flag == 1 ? Icons.shopping_cart_rounded : Icons.attach_money,
                  size: 58,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: myColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "% change",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 14),
                    child: Icon(
                      Icons.change_circle_outlined,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
