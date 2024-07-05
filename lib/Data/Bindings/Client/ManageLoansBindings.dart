import 'package:advans_app/Data/Controllers/ClientHomeController.dart';
import 'package:advans_app/Data/Controllers/manageLoansController.dart';
import 'package:advans_app/Data/Repository/ClientHomeScreenRepository.dart';
import 'package:advans_app/Data/Repository/ManageLoansRepository.dart';
import 'package:get/get.dart';

class ManageLoansBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ManageLoansRepository(apiClient: Get.find()));
    Get.put(ManageLoansController(manageLoansRepository: Get.find()));
  }
}
