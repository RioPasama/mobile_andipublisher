import 'package:andipublisher/presentation/home/views/home_category_view.dart';
import 'package:andipublisher/presentation/home/views/home_menu_view.dart';
import 'package:andipublisher/presentation/home/views/home_product_digital_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return TabBarView(
      children: [
        HomeMenuView(),
        HomeCategoryView(),
        HomeProductDigitalView(),
      ],
    );
    // Scaffold(
    //   body:
    // );

    // return RefreshIndicator(
    //   onRefresh: () => controller.onRefresh(),
    //   child: CustomScrollView(
    //     controller: controller.scrollController,
    //     slivers: [
    //       SliverAppBar(
    //         pinned: true,
    //         automaticallyImplyLeading: false,
    //         expandedHeight: Get.height / 4,
    //         backgroundColor: colorPrimary,
    //         foregroundColor: colorPrimary,
    //         flexibleSpace: FlexibleSpaceBar(
    //           titlePadding: const EdgeInsets.only(bottom: 4),
    //           expandedTitleScale: 1,
    //           background: Container(
    //             color: Colors.white,
    //             padding: const EdgeInsets.only(bottom: 32),
    //             child: FutureBuilder(
    //               future: BannerService.getBanner(),
    //               builder: (context, snapshot) {
    //                 if (snapshot.hasData) {
    //                   controller.bannerModel.value =
    //                       snapshot.data as List<BannerModel>;

    //                   return CarouselSlider.builder(
    //                       itemCount: controller.bannerModel.length,
    //                       itemBuilder: (context, index, realIndex) {
    //                         if (controller.bannerModel.isNotEmpty) {
    //                           return Container(
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(18),
    //                               image: DecorationImage(
    //                                   image: NetworkImage(controller
    //                                       .bannerModel[index].gambarBanner),
    //                                   fit: BoxFit.contain),
    //                             ),
    //                           );
    //                         } else {
    //                           return const SizedBox();
    //                         }
    //                       },
    //                       options: CarouselOptions(
    //                           autoPlay: true,
    //                           aspectRatio: 2 / 1,
    //                           enlargeCenterPage: true,
    //                           viewportFraction: 0.8));
    //                 } else {
    //                   return const SizedBox();
    //                 }
    //               },
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
