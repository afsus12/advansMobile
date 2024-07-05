import 'package:advans_app/Data/Repository/prospectListRepository.dart';
import 'package:advans_app/Models/ProspectModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProspectListController extends GetxController {
  final ProspectListRepository prospectRepository;
  ProspectListController({required this.prospectRepository});

  final box = GetStorage();
  var prospects = <ProspectRequest>[].obs;
  var isLoading = false.obs;
  var userId = 0.obs;
  var currentPage = 0.obs;
  var pageSize = 5.obs;

  String firstname = '';
  String lastname = '';
  String customer = '';

  @override
  void onInit() {
    userId.value = box.read("USERCODE");
    loadProspects(userId.value);
    super.onInit();
  }

  void loadProspects(int userCode) async {
    isLoading.value = true;
    try {
      final response = await prospectRepository.getProspects(userCode,
          firstname, lastname, customer, currentPage.value, pageSize.value);
      if (response.statusCode == 200) {
        final data = response.body['content'] as List;
        prospects.value = data.map((e) => ProspectRequest.fromJson(e)).toList();
      } else {
        Get.snackbar('Error', 'Failed to load prospects');
      }
    } finally {
      isLoading(false);
    }
  }

  void updateFilters(
      {String? newFirstname, String? newLastname, String? newCustomer}) {
    firstname = newFirstname ?? firstname;
    lastname = newLastname ?? lastname;
    customer = newCustomer ?? customer;
    currentPage.value = 0; // Reset to first page on filter change
    loadProspects(userId.value); // Reload prospects with updated filters
  }

  void loadNextPage() {
    currentPage.value += 1;
    loadProspects(userId.value);
  }

  void loadPreviousPage() {
    if (currentPage.value > 0) {
      currentPage.value -= 1;
      loadProspects(userId.value);
    }
  }
}
