import 'package:advans_app/Data/Controllers/TransactionHistoryController.dart';
import 'package:advans_app/Data/Repository/TransactionHistoryRepository.dart';
import 'package:get/get.dart';

class TransactionHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TransactionHistoryRepository(apiClient: Get.find()));
    Get.put(
        TransactionHistoryController(transactionHistoryRepository: Get.find()));
  }
}
