import 'package:advans_app/Data/Controllers/StaffOpertunityController.dart';
import 'package:advans_app/Data/Repository/StaffOpertunityRepository.dart';
import 'package:get/get.dart';

class StaffOpertunityBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StaffOpertunityRepository(apiClient: Get.find()));
    Get.put(StaffOpertunityController(staffOpertunityRepository: Get.find()));
  }
}
