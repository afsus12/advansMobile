import 'package:advans_app/Data/Controllers/ProspectListController.dart';
import 'package:advans_app/Data/Repository/prospectListRepository.dart';
import 'package:get/get.dart';

class ProspectListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProspectListRepository(apiClient: Get.find()));
    Get.put(ProspectListController(prospectRepository: Get.find()));
  }
}
