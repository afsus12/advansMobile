import 'package:advans_app/Data/Controllers/ClientRepaymentMilestonesController.dart';
import 'package:advans_app/Data/Repository/ClientRepaymentMilestonesRepository.dart';
import 'package:get/get.dart';

class RepaymentMilestonesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RepaymentMilestonesRepository(apiClient: Get.find()));
    Get.put(RepaymentMilestonesController(
        repaymentMilestonesRepository: Get.find()));
  }
}
