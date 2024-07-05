import 'package:advans_app/Data/Controllers/ClientManageLoansController.dart';
import 'package:advans_app/Data/Repository/ClientManageLoansRepository.dart';
import 'package:get/get.dart';

class ClientManageLoansBinding implements Bindings {
  @override
  void dependencies() {
    // Example initialization of ApiClient
    Get.put(ClientManageLoansRepository(apiClient: Get.find()));
    Get.put(
        ClientManageLoansController(clientManageLoansRepository: Get.find()));
  }
}
