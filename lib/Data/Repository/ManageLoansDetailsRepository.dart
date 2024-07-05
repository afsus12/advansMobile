import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:advans_app/Models/LoanApplicationModel.dart';

import 'package:get/get.dart';

class ManageLoansDetailsRepository extends GetxService {
  final ApiClient apiClient;
  ManageLoansDetailsRepository({required this.apiClient});

  Future<Response> FetchLoanDetails(int id) async {
    return await apiClient.getData("/api/v1/staff/loanapp/get/$id");
  }

  Future<Response> verifyStep1Loan(int id) async {
    return await apiClient.putData(
        "/api/v1/staff/loanapp/cc/validate/$id?status=STEP1_VERIFIED", {});
  }

  Future<Response> refuseLoan(int id) async {
    return await apiClient
        .putData("/api/v1/staff/loanapp/cc/validate/$id?status=REFUSED", {});
  }
}
