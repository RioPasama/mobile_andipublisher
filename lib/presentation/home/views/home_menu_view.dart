import 'package:andipublisher/app/data/models/label_items_master_model.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/extensions/int_extension.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/presentation/home/controllers/home.controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeMenuView extends GetView {
  HomeMenuView({Key? key}) : super(key: key);

  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView(
        children: [
          _banner(context),
          _labelItemsMaster(data: controller.newLabelItemsMasterModel.value),
          _labelItemsMaster(
              data: controller.bestSallerLabelItemsMasterModel.value),
        ],
      ),
    );
  }

  Widget _labelItemsMaster({LabelItemsMasterModel? data}) {
    return (controller.bestSallerLabelItemsMasterModel.value != null)
        ? Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  Text(
                    data?.label ?? '',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(onPressed: () {}, child: const Text('Lainnya')),
                  const SizedBox(width: 10),
                ],
              ),
              SizedBox(
                height: 340,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: data!.value.length,
                  itemBuilder: (context, index) {
                    return AspectRatio(
                      aspectRatio: 2 / 4.4,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            AspectRatio(
                                aspectRatio: 0.66 / 1,
                                child: Stack(
                                  children: [
                                    ImageNetworkView(
                                      url: data.value[index].gambar1,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(10))),
                                    ),
                                    //Diskon
                                    Visibility(
                                      visible: data.value[index].diskon != 0,
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          height: 28,
                                          width: 40,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10)),
                                              color: colorRad.withOpacity(0.9)),
                                          child: Text(
                                            '${data.value[index].diskon}%',
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),

                                    //Stok Habis
                                    Visibility(
                                      visible: !data.value[index].statusStok,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black
                                                  .withOpacity(0.8)),
                                          child: const Text(
                                            'Habis',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.value[index].judul,
                                    maxLines: 2,
                                    style: const TextStyle(fontSize: 13),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  (data.value[index].diskon != 0)
                                      ? Text(
                                          data.value[index].harga.parceRp(),
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: colorTextGrey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        )
                                      : const SizedBox(height: 20),
                                  Text(
                                    data.value[index].harga.parceRp(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        : const SizedBox();
  }

  Stack _banner(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: controller.bannerModel.length,
          itemBuilder: (context, index, realIndex) {
            if (controller.bannerModel.isNotEmpty) {
              return ImageNetworkView(
                  url: controller.bannerModel[index].gambarBanner);
            } else {
              return const SizedBox();
            }
          },
          options: CarouselOptions(
              autoPlay: (controller.bannerModel.length != 1),
              aspectRatio: 2 / 1,
              enlargeCenterPage: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                controller.currentBanner.value = index;
              }),
        ),
        Visibility(
          visible: (controller.bannerModel.length != 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: controller.bannerModel.asMap().entries.map(
              (entry) {
                return Container(
                  width: (controller.currentBanner.value == entry.key)
                      ? 14.0
                      : 6.0,
                  height: 6.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(controller.currentBanner.value == entry.key
                            ? 0.9
                            : 0.4),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
