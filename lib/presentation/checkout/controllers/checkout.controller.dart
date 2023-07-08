import 'package:andipublisher/app/data/models/checkout_model.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  CheckoutModel checkoutModel = Get.arguments;

  late DataAlamatUser selectAlamatUser;
  RxInt ongkoskirim = 0.obs;

  RxList<int> priceSubTotalItmes = <int>[].obs;

  @override
  void onInit() {
    selectAlamatUser = checkoutModel.dataUser.dataAlamatUser;
    setPriceTotalItmes();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setPriceTotalItmes() {
    for (DataCheckout dataCheckout in checkoutModel.dataCheckout) {
      for (Item item in dataCheckout.items) {
        priceSubTotalItmes.add(item.subtotal);
      }
    }
  }
}
