import 'package:advans_app/Data/Controllers/ClientSignUpController.dart';
import 'package:advans_app/Data/Repository/ClientSignUpRepository.dart';
import 'package:get/get.dart';

class ClientSignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ClientSignUpReposiotry(apiClient: Get.find()));
    Get.put(ClientSignUpController(signUpRepo: Get.find()));
  }
}
