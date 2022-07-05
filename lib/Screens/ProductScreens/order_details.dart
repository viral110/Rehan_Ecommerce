import 'package:e_commerce/Screens/common_screens.dart';
import 'package:e_commerce/Utility/color_utility.dart';
import 'package:e_commerce/Utility/common_button.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            commonAppBar(),
            Expanded(
              flex: 9,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey[400],
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjwiHVtu7k1l2sF2vgQxaM83ej__-AwCD5FA&usqp=CAU")),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Header",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Order on",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: color666666),
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 42, top: 20),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 400,
                                  width: 14,
                                  decoration: BoxDecoration(
                                      color: colorF0F0F0,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                Container(
                                  height: 200,
                                  width: 14,
                                  decoration: BoxDecoration(
                                      color: color5DB075,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 34,
                            ),
                            Container(
                              height: 440,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  commonTitle(
                                      title: "Approve Order", subTitle: "Date"),
                                  const SizedBox(
                                    width: 110,
                                  ),
                                  commonTitle(
                                      title: "Dispatch", subTitle: "Date"),
                                  const SizedBox(
                                    width: 110,
                                  ),
                                  commonTitle(
                                      title: "Out for delivery",
                                      subTitle: "Date"),
                                  const SizedBox(
                                    width: 110,
                                  ),
                                  commonTitle(
                                      title: "Delivered", subTitle: "Date"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: commonButton(OnCallBack: () {}, name: "Add to Cart"),
        ),
      ),
    );
  }

  commonTitle({String title = "", String subTitle = ""}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          subTitle,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: color666666),
        )
      ],
    );
  }
}
