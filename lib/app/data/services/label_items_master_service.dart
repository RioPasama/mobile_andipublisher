import 'package:andipublisher/app/data/models/label_items_master_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class LabelItemsMasterService {
  static Future<LabelItemsMasterModel> getItemsMaster(
      {required String link}) async {
    final result = await MainService().getAPI(url: link);
    return LabelItemsMasterModel.fromMap(result['data']);
  }
}
