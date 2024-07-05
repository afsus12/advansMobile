import 'package:advans_app/Data/Controllers/trackLoanApplicationController.dart';
import 'package:advans_app/Data/Repository/ClientTrackLoanApplicationRepository.dart';
import 'package:get/get.dart';

class TrackLoanApplicationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TrackLoanApplicationsRepository(apiClient: Get.find()));
    Get.put(TrackLoanApplicationsController(
        trackLoanApplicationsRepository: Get.find()));
  }
}
