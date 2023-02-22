import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'News App'.toUpperCase(),
          style: const TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 35,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading.value
              ? SizedBox(
                  height: Get.height,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    ...controller.result.map(
                      (element) => InkWell(
                        onTap: () {
                          // controller.getNewsLists();
                          Get.toNamed('/detail', arguments: [
                            {'id': element.id.toString()}
                          ]);
                        },
                        child: Container(
                          height: 150,
                          width: Get.width,
                          // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 120,
                                  width: 130,
                                  child: CachedNetworkImage(
                                    // repeat: ImageRepeat.repeat,
                                    height: Get.height,
                                    fit: BoxFit.cover,
                                    imageUrl: element.image.toString(),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    width: Get.width * 0.61,
                                    child: Column(
                                      children: [
                                        Text(
                                          "${element.title}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${element.shortDescription}",
                                          style: const TextStyle(),
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    controller.isLoading.value
                        ? SizedBox(
                            height: Get.height,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Obx(
                            () => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: controller.isShowButton.value
                                  ? MaterialButton(
                                      onPressed: () {
                                        controller.getMoreNews();
                                      },
                                      height: 40,
                                      color: Colors.grey[300],
                                      child: const Text("Load more"),
                                    )
                                  : Container(),
                            ),
                          ),
                  ],
                ),
        ),
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  const NewsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: Get.width,
      // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 130,
              color: Colors.amber,
            ),
            Expanded(
              child: SizedBox(
                width: Get.width * 0.61,
                child: Column(
                  children: [
                    Text(
                      "       ${"Title" * 20}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "       ${"Title" * 50}",
                      style: const TextStyle(),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
