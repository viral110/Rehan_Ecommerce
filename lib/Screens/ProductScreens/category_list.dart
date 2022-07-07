import 'package:e_commerce/DataProvider/data_provider.dart';
import 'package:e_commerce/Screens/ProductScreens/product_list.dart';
import 'package:e_commerce/Utility/color_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utility/constant.dart';
import 'category_details.dart';

class CategoryList extends StatelessWidget {
  final DataProvider dataProvider;
  CategoryList({Key? key,required this.dataProvider}) : super(key: key);

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
                        categoryList(data: dataProvider),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  categoryList({bool isShrinkWrap = true,required DataProvider data}) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      shrinkWrap: isShrinkWrap,
      childAspectRatio: 0.7,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        data.dashBoardModel!.category!.length,
            (index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => CategoryDetails());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      image: DecorationImage(
                        image: NetworkImage(
                            '${StringHelperForApiUrl.bannerUrl}${data.dashBoardModel!.category?[index].image}'),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      data.dashBoardModel!.category![index].name.toString(),
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
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

}
