import 'package:advans_app/Data/Controllers/ManageAccountController.dart';
import 'package:advans_app/Data/Repository/ManageAccountRepository.dart';
import 'package:get/get.dart';

class ManageAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ManageAccountRepository(apiClient: Get.find()));
    Get.put(ManageAccountController(manageAccountRepository: Get.find()));
  }
}
