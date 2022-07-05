import 'package:e_commerce/Screens/ProductScreens/category_list.dart';
import 'package:e_commerce/Screens/ProductScreens/order_history.dart';
import 'package:e_commerce/Screens/ProductScreens/product_list.dart';
import 'package:e_commerce/Utility/color_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: color5DB075,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Welcome ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Rehan",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Image.asset(
                          "asset/icon/Search.png",
                          scale: 5,
                        ),
                        const SizedBox(
                          width: 38,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => OrderHistory());
                          },
                          child: Image.asset(
                            "asset/icon/Category.png",
                            scale: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 9,
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.grey[400],
                          height: 250,
                          width: double.infinity,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Text(
                            "Category",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: double.infinity,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 8,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    EdgeInsets.only(left: index == 0 ? 24 : 15),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => CategoryList());
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: NetworkImage(
                                                "https://images.pexels.com/photos/335257/pexels-photo-335257.jpeg?cs=srgb&dl=pexels-eprism-studio-335257.jpg&fm=jpg")),
                                        color: Colors.grey[400],
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Text(
                            "New Product",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                        ),
                        productList()
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
