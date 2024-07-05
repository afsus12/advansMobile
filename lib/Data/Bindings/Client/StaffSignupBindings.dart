import 'package:advans_app/Data/Controllers/StaffSignUpController.dart';
import 'package:advans_app/Data/Repository/StaffSignUpRepository.dart';
import 'package:get/get.dart';

class StaffSignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StaffSignUpRepository(apiClient: Get.find()));
    Get.put(StaffSignUpController(staffSignUpRepository: Get.find()));
  }
}
