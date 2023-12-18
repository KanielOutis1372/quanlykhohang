// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import '../data/models/my_config.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    required this.data,
    required this.nameCard,
    this.colorPrimary,
    this.colorSecond,
    this.icon,
    super.key,
  });

  var data, nameCard, colorPrimary, colorSecond, icon;

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            color: colorSecond ?? Colors.orange[700],
            child: Icon(
              icon ?? Icons.warehouse_rounded,
              size: MyConfig.PRIMARY_FONT_SIZE_ICON.toDouble() + 30,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              height: 80,
              color: colorPrimary ?? Colors.orange[300],
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      nameCard,
                      style: TextStyle(
                        fontSize: MyConfig.SECOND_FONT_SIZE_TEXT.toDouble(),
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      data,
                      style: TextStyle(
                        fontSize:
                            MyConfig.PRIMARY_FONT_SIZE_TEXT.toDouble() + 6,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
