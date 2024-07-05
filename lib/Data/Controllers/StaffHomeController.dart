import 'package:advans_app/Data/Repository/StaffHomeScreenRepository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StaffHomeController extends GetxController {
  final StaffHomeScreenRepository staffHomeScreenRepository;

  StaffHomeController({required this.staffHomeScreenRepository});
  final box = GetStorage();
  var name = "".obs;
  var lname = "".obs;
  var isVisible = false.obs;

  @override
  void onInit() {
    name.value = box.read("NAME");
    lname.value = box.read("LNAME");
    super.onInit();
  }
}
