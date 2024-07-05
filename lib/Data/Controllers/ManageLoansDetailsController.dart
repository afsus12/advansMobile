import 'package:advans_app/Data/Controllers/ManageLoansController.dart';
import 'package:advans_app/Data/Repository/ManageLoansDetailsRepository.dart';
import 'package:advans_app/Data/Repository/ManageLoansRepository.dart';
import 'package:advans_app/Models/LoanApplicationGloablModel.dart';
import 'package:advans_app/Models/LoanApplicationModel.dart';
import 'package:advans_app/routes/routes_guide.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ManageLoansDetailsController extends GetxController {
  final ManageLoansDetailsRepository manageLoansDetailsRepository;
  ManageLoansDetailsController({required this.manageLoansDetailsRepository});
  final box = GetStorage();
  var token = "";
  @override
  void onInit() async {
    super.onInit();
    token = box.read("TOKEN");
    int loanId = Get.arguments;
    await fetchLoanDetails(loanId);
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
  var loanDetails = LoanApplication(
          nationalite: "",
          age: 0,
          clientId: 0,
          experienceDuration: "",
          loanPurpose: "",
          productName: "",
          governorat: "",
          activityAdresse: "",
          fullName: "",
          customer: "",
          activityType: "",
          previousMicrofinanceInstitution: "",
          requestedCreditAmount: 0)
      .obs;
  Future<void> refuseLoan(int id) async {
    loading.value = true;
    try {
      final response = await manageLoansDetailsRepository.refuseLoan(id);
      if (response.statusCode == 200) {
        print(response.body);

        Get.offNamed(routesGuide.mangeLoanScreen);
      } else {
        Get.snackbar('Error', 'Failed to set  loan Status');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    loading.value = false;
  }

  Future<void> acceptLoan(int id) async {
    loading.value = true;
    try {
      final response = await manageLoansDetailsRepository.verifyStep1Loan(id);
      if (response.statusCode == 200) {
        print(response.body);

        Get.offNamed(routesGuide.mangeLoanScreen);
        Get.snackbar('Error', 'loan application $id Accepted');
      } else {
        Get.snackbar('Error', 'Failed to set  loan Status');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    loading.value = false;
  }

  Future<void> fetchLoanDetails(int id) async {
    loading.value = true;
    try {
      final response = await manageLoansDetailsRepository.FetchLoanDetails(id);
      if (response.statusCode == 200) {
        loanDetails.value = LoanApplication.fromJson(response.body);
        print(response.body);
      } else {
        Get.snackbar('Error', 'Failed to fetch loan details');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    loading.value = false;
  }
}
