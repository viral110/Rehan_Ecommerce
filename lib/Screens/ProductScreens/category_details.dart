import 'package:e_commerce/Screens/common_screens.dart';
import 'package:e_commerce/Utility/color_utility.dart';
import 'package:e_commerce/Utility/common_button.dart';
import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            commonAppBar(),
            Expanded(
                flex: 9,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "https://media.istockphoto.com/photos/dark-blue-stands-product-stand-blank-scene-picture-id1344461552?b=1&k=20&m=1344461552&s=170667a&w=0&h=7oV89M1fjxcMca3vCVCUI4CvQ7QKmaEgUAMPSUtEVLI="))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Product Name",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "I would like to receive your newsletter and other promotional information.",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: color666666),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Expanded(
                  child: commonButton(
                      OnCallBack: () {}, name: "Add to Cart", width: 30)),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: commonButton(
                    OnCallBack: () {},
                    name: "Buy Now",
                    backgroundColor: colorF6F6F6,
                    textColor: color5DB075),
              )
            ],
          ),
        ),
      ),
    );
  }
}
