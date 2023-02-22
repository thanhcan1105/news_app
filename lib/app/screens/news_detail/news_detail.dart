import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsDetialScreen extends GetView<HomeController> {
  const NewsDetialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String id = Get.arguments[0]['id'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          'News Detail'.toUpperCase(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              //title
              Text(
                controller.result
                    .where((p0) => p0.id == int.parse(id))
                    .first
                    .title
                    .toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //short description
              Text(
                controller.result
                    .where((p0) => p0.id == int.parse(id))
                    .first
                    .shortDescription
                    .toString(),
                style: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //image
              CachedNetworkImage(
                width: Get.width * 0.8,
                imageUrl: controller.result
                    .where((p0) => p0.id == int.parse(id))
                    .first
                    .image
                    .toString(),
              ),
              //description
              Text(
                controller.result
                    .where((p0) => p0.id == int.parse(id))
                    .first
                    .description
                    .toString(),
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              //date
              Container(
                padding: const EdgeInsets.only(
                  top: 5,
                  right: 5,
                  bottom: 5,
                ),
                width: Get.width,
                child: Text(
                  controller.result
                      .where((p0) => p0.id == int.parse(id))
                      .first
                      .date
                      .toString(),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
