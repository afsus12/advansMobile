import 'package:advans_app/Data/Repository/ManageAccountRepository.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ManageAccountController extends GetxController {
  final ManageAccountRepository manageAccountRepository;
  ManageAccountController({required this.manageAccountRepository});
  final box = GetStorage();
  var name = "".obs;
  var lname = "".obs;
  var email = "".obs;
  var phoneNumber = "".obs;
  var isVisible = false.obs;
  var userId = 0.obs;
  var loading = false.obs;

  @override
  void onInit() {
    userId.value = box.read("USERCODE");
    int id = userId.value;
    super.onInit();
  }

  Future<void> updateAccountDetails(Map<String, dynamic> details) async {
    loading.value = true;
    final response = await manageAccountRepository.updateAccountDetails(
        userId.value, details);
    loading.value = false;
    if (response.isOk) {
      // Handle successful update
    } else {
      // Handle update failure
    }
  }
}
