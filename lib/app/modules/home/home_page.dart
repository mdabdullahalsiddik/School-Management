import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: const Icon(Icons.school),
        title: const Text('DPI'),
      ),
      body: Center(
        child: Column(
          children: [
            const Gap(10),
            SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("banner")
                      .snapshots(),
                  builder: (context, snapshot) {
                    List bannerItem = snapshot.data?.docs ?? [];
                    return CarouselSlider.builder(
                      itemCount: bannerItem.length,
                      itemBuilder: (context, index, realIndex) {
                        if (bannerItem.isEmpty) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                bannerItem[index]["image"],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayCurve: Curves.easeInOut,
                        enlargeCenterPage: true,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
