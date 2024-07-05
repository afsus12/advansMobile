import 'package:advans_app/Data/Controllers/ClientHomeController.dart';
import 'package:advans_app/Data/Repository/ClientHomeScreenRepository.dart';
import 'package:get/get.dart';

class ClientHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ClientHomeScreenRepository(apiClient: Get.find()));
    Get.put(ClientHomeController(clientHomeScreenRepository: Get.find()));
  }
}
