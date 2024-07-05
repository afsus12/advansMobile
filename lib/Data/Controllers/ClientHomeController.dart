import 'package:advans_app/Data/Repository/ClientHomeScreenRepository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ClientHomeController extends GetxController {
  final ClientHomeScreenRepository clientHomeScreenRepository;
  ClientHomeController({required this.clientHomeScreenRepository});
  final box = GetStorage();
  var name = "".obs;
  var lname = "".obs;
  var isVisible = false.obs;
  var Status = "NOT_ACTIVE".obs;
  var loading = false.obs;
  var userId = 0.obs;

  @override
  void onInit() {
    userId.value = box.read("USERCODE");
    int id = userId.value;
    name.value = box.read("NAME");

    lname.value = box.read("LNAME");
    fetchClient(id);
    super.onInit();
  }

  Future<void> fetchClient(int id) async {
    loading.value = true;
    update();

    try {
      final response = await clientHomeScreenRepository.FetchClient(id);
      if (response != null) {
        print('response ${response.body}');
        if (response.statusCode == 200) {
          print("200");
          print(response.body);

          Status.value = response.body["status"];
          print("status == " + Status.value);
        } else {
          /*       Get.snackbar(
            AppLocalizations.of(context)!.error,
            AppLocalizations.of(context)!.verify_details,
          ); */
          if (response.statusCode == 401) {
            print('Unauthorized');
          } else {
            print('Error: ${response.statusCode}');
          }
        }
      } else {
        print('Server error: Response is null');
      }
    } catch (e) {
      print('Exception during login: $e');
    }

    loading.value = false;
    update();
  }
}
