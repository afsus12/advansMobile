import 'dart:io';

import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:advans_app/Models/LoanApplicationModel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoanApplicationRepository extends GetxService {
  final ApiClient apiClient;
  LoanApplicationRepository({required this.apiClient});
  Future<http.Response> createLoanApp(
      LoanApplication body, List<File> files) async {
    return await apiClient.postDataWithFile(
        "/api/v1/staff/loanapp/apply", body, files);
  }

  Future<Response> FetchClient(int id) async {
    return await apiClient.getData("/api/v1/staff/loanapp/getClient/$id");
  }
}
