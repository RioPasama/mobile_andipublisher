import 'package:andipublisher/app/data/models/banner_model.dart';
import 'package:andipublisher/app/data/models/label_items_master_model.dart';
import 'package:andipublisher/app/data/services/banner_service.dart';
import 'package:andipublisher/app/data/services/label_items_master_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();

  RxList<BannerModel> bannerModel = RxList<BannerModel>();
  Rxn<LabelItemsMasterModel> newLabelItemsMasterModel =
      Rxn<LabelItemsMasterModel>();
  Rxn<LabelItemsMasterModel> bestSallerLabelItemsMasterModel =
      Rxn<LabelItemsMasterModel>();

  RxInt currentBanner = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    await fetchDataHome();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onRefresh() async {
    await fetchDataHome();
  }

  Future<void> fetchDataHome() async {
    await fetchBanner();
    await newLabelItemsMaster();
    await bestSallerLabelItemsMaster();
  }

  Future<void> fetchBanner() async {
    bannerModel.value = await BannerService.getBanner();
  }

  Future<void> newLabelItemsMaster() async {
    newLabelItemsMasterModel.value =
        await LabelItemsMasterService.getItemsMaster(link: 'ItemsMaster/new');
  }

  Future<void> bestSallerLabelItemsMaster() async {
    bestSallerLabelItemsMasterModel.value =
        await LabelItemsMasterService.getItemsMaster(
            link: 'ItemsMaster/bestSaller');
  }
}
