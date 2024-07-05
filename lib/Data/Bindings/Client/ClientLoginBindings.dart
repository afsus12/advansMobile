import 'package:advans_app/Data/Controllers/ClientSignInController.dart';
import 'package:advans_app/Data/Repository/ClientSignInRepository.dart';
import 'package:get/get.dart';

class ClientSignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ClientSignInRepository(apiClient: Get.find()));
    Get.put(ClientSignInController(clientSignInRepository: Get.find()));
  }
}
