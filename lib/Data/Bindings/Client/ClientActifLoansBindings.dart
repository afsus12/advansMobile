import 'package:advans_app/Data/Controllers/ClientActiveLoansController.dart';
import 'package:advans_app/Data/Controllers/ClientHomeController.dart';
import 'package:advans_app/Data/Repository/ClientActiveLoansRepository.dart';

import 'package:get/get.dart';

class ClientActifLoansBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ClientActiveLoansRepository(apiClient: Get.find()));
    Get.put(
        ClientActiveLoansController(clientActiveLoansRepository: Get.find()));
  }
}
