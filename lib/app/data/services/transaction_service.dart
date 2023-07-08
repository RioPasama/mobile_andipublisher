import 'package:andipublisher/app/data/models/checkout_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class TransactionService {
  static Future<CheckoutModel> postCheckout(
      {required String tag,
      required List<String> ids,
      String? idCabang,
      int? quantityOrderDireck}) async {
    Map<String, dynamic> body = {
      'tag': tag,
      'idUser': MainService().utilsController.userModel.idUser,
      'idCabang': idCabang,
      'quantityOrderDireck': quantityOrderDireck.toString(),
    };

    for (int i = 0; i < ids.length; i++) {
      body.addAll({'id[$i]': ids[i]});
    }

    final result =
        await MainService().postAPI(url: 'Transaction/checkout', body: body);

    return CheckoutModel.fromJson(result['data']);
  }
}
