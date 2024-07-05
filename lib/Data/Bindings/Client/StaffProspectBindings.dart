import 'package:advans_app/Data/Controllers/StaffProspectController.dart';
import 'package:advans_app/Data/Repository/StaffProspectRepository.dart';
import 'package:get/get.dart';

class StaffProspectBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StaffProspectRepository(apiClient: Get.find()));
    Get.put(StaffProspectController(staffProspectRepository: Get.find()));
  }
}
