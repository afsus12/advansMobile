import 'package:advans_app/Data/Controllers/StaffSignInController.dart';
import 'package:advans_app/Data/Repository/StaffSignInRepository.dart';
import 'package:get/get.dart';

class StaffLoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StaffSignInRepository(apiClient: Get.find()));
    Get.put(StaffSignInController(staffSignInRepository: Get.find()));
  }
}
