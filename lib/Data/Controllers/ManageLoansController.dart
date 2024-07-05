import 'package:advans_app/Data/Repository/ManageLoansRepository.dart';
import 'package:advans_app/Models/LoanApplicationGloablModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ManageLoansController extends GetxController {
  final ManageLoansRepository manageLoansRepository;
  ManageLoansController({required this.manageLoansRepository});
  final box = GetStorage();
  var currentPage = 0.obs;
  var pageSize = 5.obs;
  String status = '';
  var userCode = 0;
  var userId = 0.obs;
  var totalpage = 0.obs;
  @override
  void onInit() {
    userCode = box.read("USERCODE");
    userId.value = userCode;
    fetchLoanApplications(userId.value);
    super.onInit();
  }

  @override
  onDispose() {
    super.dispose();
  }

  var filter = TextEditingController().obs;
  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;

  var loanApplications = <LoanApplicationGlobalModel>[].obs;
  var loading = false.obs;
  void updateFilters({String? newStatus}) {
    status = newStatus ?? status;
    currentPage.value = 0; // Reset to first page on filter change
    fetchLoanApplications(
        userId.value); // Reload prospects with updated filters
  }

  void loadNextPage() {
    currentPage.value += 1;
    fetchLoanApplications(userId.value);
  }

  void loadPreviousPage() {
    if (currentPage.value > 0) {
      currentPage.value -= 1;
      fetchLoanApplications(userId.value);
    }
  }

  Future<void> fetchLoanApplications(int id) async {
    loading.value = true;
    try {
      final applications = await manageLoansRepository.fetchLoanListDetails(
          id, status, currentPage.value, pageSize.value);
      loanApplications.assignAll(applications);
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Failed to fetch loan applications',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      loading.value = false;
    }
  }
}
