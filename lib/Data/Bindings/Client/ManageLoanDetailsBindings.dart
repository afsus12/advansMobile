import 'package:advans_app/Data/Controllers/ManageLoansDetailsController.dart';
import 'package:advans_app/Data/Repository/ManageLoansDetailsRepository.dart';
import 'package:get/get.dart';

class ManageLoanDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ManageLoansDetailsRepository(apiClient: Get.find()));
    Get.put(
        ManageLoansDetailsController(manageLoansDetailsRepository: Get.find()));
  }
}
