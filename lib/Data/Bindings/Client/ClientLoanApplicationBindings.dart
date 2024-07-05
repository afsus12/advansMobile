import 'package:advans_app/Data/Controllers/ClientLoanApplicationController.dart';
import 'package:advans_app/Data/Controllers/StaffSignUpController.dart';
import 'package:advans_app/Data/Repository/LoanApplicationRepository.dart';
import 'package:advans_app/Data/Repository/StaffSignUpRepository.dart';
import 'package:get/get.dart';

class ClientLoanApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoanApplicationRepository(apiClient: Get.find()));
    Get.put(
        ClientLonaApplicationController(loanApplicationRepository: Get.find()));
  }
}
