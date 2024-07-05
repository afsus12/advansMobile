import 'package:advans_app/Data/Controllers/ClientTransferController.dart';
import 'package:advans_app/Data/Repository/ClientTransferRepository.dart';
import 'package:get/get.dart';

class ClientTransferBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ClientTransferRepository(apiClient: Get.find()));
    Get.put(ClientTransferController(clientTransferRepository: Get.find()));
  }
}
