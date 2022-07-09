import 'package:e_commerce/Screens/common_screens.dart';
import 'package:e_commerce/Utility/color_utility.dart';
import 'package:e_commerce/Utility/common_button.dart';
import 'package:e_commerce/Utility/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../DataProvider/data_provider.dart';

class CategoryDetails extends StatefulWidget {
  final int? productId;

  const CategoryDetails({Key? key, this.productId}) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails>
    with WidgetsBindingObserver {
  List<String> imageStore = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final fetchProductDetail =
        Provider.of<DataProvider>(context, listen: false);
    fetchProductDetail.getProductDetailProvider(context, widget.productId);
    print(fetchProductDetail);
    if (fetchProductDetail.getProductDetails?.data?.image1 != null) {
      imageStore.add(fetchProductDetail.getProductDetails!.data!.image1!);
    } else if (fetchProductDetail.getProductDetails?.data?.image2 != null) {
      imageStore.add(fetchProductDetail.getProductDetails!.data!.image2!);
    } else if (fetchProductDetail.getProductDetails?.data?.imag3 != null) {
      imageStore.add(fetchProductDetail.getProductDetails!.data!.imag3!);
    } else if (fetchProductDetail.getProductDetails?.data?.image4 != null) {
      imageStore.add(fetchProductDetail.getProductDetails!.data!.image4!);
    }
    if (fetchProductDetail.getProductDetails?.data?.video != null) {
      _videoPlayerController = VideoPlayerController.network(
          "${StringHelperForApiUrl.bannerUrl}${fetchProductDetail.getProductDetails!.data!.video!}");
      _initializedVideoPlayer = _videoPlayerController!.initialize();
      _videoPlayerController?.addListener(() {
        setState(() {});
      });

      _videoPlayerController?.setLooping(true);
      _videoPlayerController?.setVolume(1.0);
      print("${StringHelperForApiUrl.bannerUrl}${fetchProductDetail.getProductDetails!.data!.video!}");

    }
    WidgetsBinding.instance?.addObserver(this);


  }

  PageController controller = PageController();

  VideoPlayerController? _videoPlayerController;

  void startVideo(DataProvider fetchProductDetail) {


  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);

    _videoPlayerController?.dispose();
    super.dispose();

    // print("******* oooooo ******");
  }

  void incrementCounter() {
    setState(() {
      _videoPlayerController!.value.isPlaying
          ? _videoPlayerController!.pause()
          : _videoPlayerController!.play();
    });
  }

  void getChangedPageAndMoveBar(int page) {
    currentPageValue = page;
    setState(() {});
  }

  int currentPageValue = 0;

  Future<void>? _initializedVideoPlayer;

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: data.isLoading == false
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
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
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),

                                ),
                                child: PageView.builder(
                                  controller: controller,
                                  onPageChanged: (value) {
                                    getChangedPageAndMoveBar(value);
                                  },
                                  itemCount: 2,
                                  physics: ClampingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          FutureBuilder(
                                              future: _initializedVideoPlayer,
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.done) {
                                                  return AspectRatio(
                                                    aspectRatio:
                                                        _videoPlayerController!
                                                            .value.aspectRatio,
                                                    child: VideoPlayer(
                                                        _videoPlayerController!),
                                                  );
                                                } else {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                }
                                              }),
                                          _videoPlayerController?.value == null
                                          ? Container()
                                          : GestureDetector(
                                            onTap: incrementCounter,
                                            child: CircleAvatar(
                                              radius: 27,
                                              backgroundColor:
                                                  Colors.black.withOpacity(0.6),
                                              child: Icon(
                                                  _videoPlayerController!
                                                          .value.isPlaying
                                                      ? Icons.pause
                                                      : Icons.play_arrow),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
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
