import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Api_Services/api.dart';
import 'package:e_commerce/DataProvider/data_provider.dart';
import 'package:e_commerce/Screens/ProductScreens/order_history.dart';
import 'package:e_commerce/Utility/color_utility.dart';
import 'package:e_commerce/Utility/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
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
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if (controller.hasClients) {
        controller.animateToPage(
          currentPageValue,
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeIn,
        );
      }
    });
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (fetchDashBoardData.isLoading == true) {
        if (currentPageValue ==
            fetchDashBoardData.dashBoardModel?.banner?.length) {
          end = true;
        } else if (currentPageValue == 0) {
          end = false;
        }
      }

      if (end == false) {
        currentPageValue++;
      } else {
        currentPageValue--;
      }

      controller.animateToPage(
        currentPageValue,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeIn,
      );
    });
  }

  int activePage = 0;
  int currentPageValue = 0;

  bool end = false;

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
        top: false,
        child: data.isLoading == false
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Container(
                    color: color5DB075,
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome ",
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Rb",
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                Get.to(() => OrderHistory());
                              },
                              icon: Icon(
                                IconlyBold.category,
                                color: Colors.white,
                                size: 30.sp,
                              ),
                            ),
                            // IconButton(
                            //   onPressed: () {
                            //     storageKey.delete(key: 'access_key');
                            //     Fluttertoast.showToast(msg: "Logout");
                            //     Get.to(() => LoginScreen());
                            //   },
                            //   icon: const Icon(
                            //     IconlyLight.logout,
                            //     color: Colors.white,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: NestedScrollView(
                      headerSliverBuilder: (context, _) {
                        return [
                          SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                data.dashBoardModel!.banner!.isEmpty
                                    ? const SizedBox(
                                        height: 0,
                                        width: 0,
                                      )
                                    : SizedBox(
                                        height: 250.h,
                                        child: PageView.builder(
                                          itemCount: data
                                              .dashBoardModel?.banner?.length,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          onPageChanged: (value) {
                                            getChangedPageAndMoveBar(value);
                                          },
                                          controller: controller,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.2),
                                                    blurRadius: 5.0,
                                                    offset: const Offset(0, 0),
                                                  )
                                                ],
                                              ),
                                              margin:
                                                  const EdgeInsets.all(10.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "${StringHelperForApiUrl.bannerUrl}${data.dashBoardModel!.banner?[index].featureImage}",
                                                  width: 100.sw,
                                                  height: 100.sh,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      for (int i = 0;
                                          i <
                                              data.dashBoardModel!.banner!
                                                  .length;
                                          i++)
                                        if (i == currentPageValue) ...[
                                          circleBar(true)
                                        ] else
                                          circleBar(false),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.w,
                                    bottom: 10.h,
                                    top: 10.h,
                                  ),
                                  child: const Text(
                                    "Category",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                SizedBox(
                                  height: 120.h,
                                  width: double.infinity,
                                  child: ListView.builder(
                                    padding: EdgeInsets.only(
                                      top: 10.h,
                                      left: 10.w,
                                      right: 10.w,
                                      bottom: 10.h,
                                    ),
                                    shrinkWrap: true,
                                    itemCount:
                                        data.dashBoardModel?.category?.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 85.h,
                                              width: 85.h,
                                              decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image:
                                                      CachedNetworkImageProvider(
                                                    "${StringHelperForApiUrl.bannerUrl}${data.dashBoardModel!.category?[index].image}",
                                                  ),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.2),
                                                    blurRadius: 5.0,
                                                    offset: const Offset(0, 0),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              data.dashBoardModel!
                                                  .category![index].name!,
                                              style: GoogleFonts.inter(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ];
                      },
                      // You tab view goes here
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              bottom: 10.h,
                              top: 10.h,
                            ),
                            child: Text(
                              "New Product's",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.inter(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Expanded(
                            child: newProductList(data: data),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: isActive ? 7 : 7,
      width: isActive ? 7 : 7,
      decoration: BoxDecoration(
          color: isActive ? Colors.pink : Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  newProductList({bool isShrinkWrap = true, required DataProvider data}) {
    return GridView.builder(
      padding: EdgeInsets.only(
        top: 10.h,
        left: 10.w,
        right: 10.w,
        bottom: 10.h,
      ),
      itemBuilder: (ctx, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5.0,
                offset: const Offset(0, 0),
              )
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () async {
              Get.to(() => CategoryDetails(
                    productId: data.dashBoardModel!.product![index].id,
                  ));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          '${StringHelperForApiUrl.bannerUrl}${data.dashBoardModel?.product?[index].image1}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    data.dashBoardModel!.product![index].name!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: data.dashBoardModel!.product![index].discount ==
                              null
                          ? Text(
                              "₹ ${data.dashBoardModel!.product![index].amount!}",
                              style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "₹ ${data.dashBoardModel!.product![index].amount!}",
                                    style: GoogleFonts.inter(
                                      fontSize: 12.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "₹ ${data.dashBoardModel!.product![index].discount!}",
                                    style: GoogleFonts.inter(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                )
              ],
            ),
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.7,
      ),
      itemCount: data.dashBoardModel!.product!.length,
      shrinkWrap: isShrinkWrap,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
