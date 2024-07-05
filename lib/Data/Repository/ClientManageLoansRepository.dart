import 'package:advans_app/Data/Api/ApiClient.dart';

import 'package:get/get.dart';

class ClientManageLoansRepository extends GetxService {
  final ApiClient apiClient;

  ClientManageLoansRepository({required this.apiClient});

  Future<Response> checkHeCanDemande(int id) async {
    return await apiClient.getData("/api/v1/staff/loanapp/canApply/$id");
  }
}
