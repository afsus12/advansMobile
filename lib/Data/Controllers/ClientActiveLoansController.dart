import 'package:advans_app/Data/Repository/ClientActiveLoansRepository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ClientActiveLoansController extends GetxController {
  final ClientActiveLoansRepository clientActiveLoansRepository;
  ClientActiveLoansController({required this.clientActiveLoansRepository});
  final box = GetStorage();
  var name = "".obs;
  var lname = "".obs;
  var isVisible = false.obs;
  var userId = 0.obs;
  var loading = false.obs;
  var loans = [].obs;
  @override
  void onInit() {
    userId.value = box.read("USERCODE");
    int id = userId.value;
    fetchActiveLoans(id);

    super.onInit();
  }

  void fetchActiveLoans(int id) async {
    loading.value = true;
    final response = await clientActiveLoansRepository.getActiveLoans(id);
    loading.value = false;
    if (response.isOk) {
      loans.value = response.body;
    } else {
      // Handle error
    }
  }
}
