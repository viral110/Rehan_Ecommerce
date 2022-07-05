import 'package:e_commerce/Screens/ProductScreens/product_list.dart';
import 'package:e_commerce/Utility/color_utility.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      height: 90,
                      color: color5DB075,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 9,
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Handles",
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              color: color5DB075),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        productList()
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
