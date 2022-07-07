import 'package:e_commerce/Screens/ProductScreens/category_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

productList({bool isShrinkWrap = true}) {
  return GridView.count(
    crossAxisCount: 3,
    crossAxisSpacing: 10.0,
    mainAxisSpacing: 10.0,
    shrinkWrap: isShrinkWrap,
    childAspectRatio: 0.7,
    physics: const NeverScrollableScrollPhysics(),
    children: List.generate(
      8,
      (index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              Get.to(() => CategoryDetails());
            },
            child: Column(
              children: [
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    image: const DecorationImage(
                      image: NetworkImage(
                          'http://dacon.rwdc.sg/wp-content/uploads/2021/01/test-product.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Item #1 NameGoes Here",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "\$19.99",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
