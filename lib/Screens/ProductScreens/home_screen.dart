import 'package:e_commerce/Api_Services/api.dart';
import 'package:e_commerce/DataProvider/data_provider.dart';
import 'package:e_commerce/Screens/AuthScreen/login_screen.dart';
import 'package:e_commerce/Screens/ProductScreens/category_list.dart';
import 'package:e_commerce/Screens/ProductScreens/order_history.dart';
import 'package:e_commerce/Screens/ProductScreens/product_list.dart';
import 'package:e_commerce/Utility/color_utility.dart';
import 'package:e_commerce/Utility/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'category_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final fetchDashBoardData =
        Provider.of<DataProvider>(context, listen: false);
    fetchDashBoardData.getDashBoardDetailsProvider(context);
  }

  int activePage = 0;

  PageController controller = PageController();

  void getChangedPageAndMoveBar(int page) {
    activePage = page;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: data.isLoading == false
            ? const Center(child: CircularProgressIndicator())
            : Column(
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
                            const SizedBox(
                              width: 38,
                            ),
                            GestureDetector(
                              onTap: () {
                                storageKey.delete(key: 'access_key');
                                Fluttertoast.showToast(msg: "Logout");
                                Get.to(() => LoginScreen());
                              },
                              child: const Icon(Icons.logout,color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 250,
                              child: PageView.builder(
                                itemCount: data.dashBoardModel?.banner?.length,
                                physics: const ClampingScrollPhysics(),
                                onPageChanged: (value) {
                                  getChangedPageAndMoveBar(value);
                                },
                                controller: controller,
                                itemBuilder: (context, index) {
                                  return  Container(
                                    child: Image.network(
                                        "${StringHelperForApiUrl.bannerUrl}${data.dashBoardModel!.banner?[index].featureImage}"),
                                  );
                                },
                              ),
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
                                itemCount:
                                    data.dashBoardModel?.category?.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: index == 0 ? 24 : 15),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(() => CategoryList(
                                              dataProvider: data,
                                            ));
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${StringHelperForApiUrl.bannerUrl}${data.dashBoardModel!.category?[index].image}")),
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
                            newProductList(data: data),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  newProductList({bool isShrinkWrap = true,required DataProvider data}) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      shrinkWrap: isShrinkWrap,
      childAspectRatio: 0.7,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        data.dashBoardModel!.product!.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const CategoryDetails());
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
                            '${StringHelperForApiUrl.bannerUrl}${data.dashBoardModel?.product?[index].image1}'),
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
                      data.dashBoardModel!.product![index].name!,
                      style:
                          const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "\$${data.dashBoardModel!.product![index].amount!}",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
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
