import 'package:andipublisher/app/data/models/banner_model.dart';
import 'package:andipublisher/app/data/models/label_items_master_model.dart';
import 'package:andipublisher/app/data/services/banner_service.dart';
import 'package:andipublisher/app/data/services/items_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// HomeController
///
/// This class is a controller for the home page.

/// Properties
///
/// * `scrollController`: The scroll controller for the home page.
/// * `bannerModel`: The list of banner models.
/// * `newLabelItemsMasterModel`: The new label items master model.
/// * `bestSallerLabelItemsMasterModel`: The best seller label items master model.
/// * `currentBanner`: The current banner index.

/// Methods
///
/// * `onRefresh`: Handles the refresh event.
/// * `fetchBanner`: Fetches the list of banners.
/// * `newLabelItemsMaster`: Fetches the new label items master.
/// * `bestSallerLabelItemsMaster`: Fetches the best seller label items master.

/// Usage
///
/// To use this class, first you need to import it. Then, you can instantiate it like this:
///
///
/// HomeController controller = HomeController();
///
/// This code will instantiate a HomeController object.

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
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onRefresh() async {
    await fetchBanner();
    await newLabelItemsMaster();
    await bestSallerLabelItemsMaster();
  }

  Future<List<BannerModel>> fetchBanner() async {
    bannerModel.value = await BannerService.getBanner();
    return bannerModel;
  }

  Future<LabelItemsMasterModel> newLabelItemsMaster() async {
    newLabelItemsMasterModel.value =
        await ItemsService.getItemsMaster(link: 'new');
    return newLabelItemsMasterModel.value!;
  }

  Future<LabelItemsMasterModel> bestSallerLabelItemsMaster() async {
    bestSallerLabelItemsMasterModel.value =
        await ItemsService.getItemsMaster(link: 'bestSaller');
    return bestSallerLabelItemsMasterModel.value!;
  }
}
