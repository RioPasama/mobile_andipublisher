import 'package:andipublisher/presentation/transaction/controllers/transaction.controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TransactionUnpaidView extends GetView {
  TransactionUnpaidView({Key? key}) : super(key: key);

  @override
  final TransactionController controller = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}
