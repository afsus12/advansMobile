import 'package:advans_app/Data/Repository/ClientTrackLoanApplicationRepository.dart';
import 'package:advans_app/Models/LoanApplicationGloablModel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TrackLoanApplicationsController extends GetxController {
  final TrackLoanApplicationsRepository trackLoanApplicationsRepository;
  TrackLoanApplicationsController(
      {required this.trackLoanApplicationsRepository});
  var loading = false.obs;
  var filter = TextEditingController().obs;
  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
  final box = GetStorage();
  var currentPage = 0.obs;
  var pageSize = 5.obs;
  var totalpages = 0.obs;
  String status = '';

  var userId = 0.obs;
  var loanApplications = <LoanApplicationGlobalModel>[].obs;
  @override
  void onInit() {
    int userCode = box.read("USERCODE") as int;
    userId.value = userCode;
    fetchLoanApplications(userId.value);
    super.onInit();
  }

  void updateFilters({String? newStatus}) {
    status = newStatus ?? status;
    currentPage.value = 0; // Reset to first page on filter change
    fetchLoanApplications(
        userId.value); // Reload prospects with updated filters
  }

  void loadNextPage() {
    if (currentPage.value <= totalpages.value) {
      currentPage.value += 1;
      fetchLoanApplications(userId.value);
    }
  }

  void loadPreviousPage() {
    if (currentPage.value > 0) {
      currentPage.value -= 1;
      fetchLoanApplications(userId.value);
    }
  }

  void fetchLoanApplications(int id) async {
    loading.value = true;
    try {
      final response = await trackLoanApplicationsRepository.fetchApplications(
          id, status, currentPage.value, pageSize.value);
      if (response.statusCode == 200) {
        final data = response.body['content'] as List;
        totalpages.value = response.body['totalPages'] as int;
        print(totalpages.value);
        loanApplications.value =
            data.map((e) => LoanApplicationGlobalModel.fromJson(e)).toList();
      } else {
        Get.snackbar('Error', 'Failed to load applications  ');
      }
    } finally {
      loading(false);
    }
  }
}
