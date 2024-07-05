import 'package:advans_app/Data/Controllers/StaffHomeController.dart';
import 'package:advans_app/Data/Repository/StaffHomeScreenRepository.dart';
import 'package:get/get.dart';

class StaffHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StaffHomeScreenRepository(apiClient: Get.find()));
    Get.put(StaffHomeController(staffHomeScreenRepository: Get.find()));
  }
}
