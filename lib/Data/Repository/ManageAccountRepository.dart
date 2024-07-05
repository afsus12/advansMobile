import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:get/get.dart';

class ManageAccountRepository extends GetxService {
  final ApiClient apiClient;

  ManageAccountRepository({required this.apiClient});

  Future<Response> getAccountDetails(int id) async {
    return await apiClient.getData("/api/v1/account/$id");
  }

  Future<Response> updateAccountDetails(
      int id, Map<String, dynamic> details) async {
    return await apiClient.putData("/api/v1/account/$id", details);
  }
}
