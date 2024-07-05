import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:get/get.dart';

class ClientHomeScreenRepository extends GetxService {
  final ApiClient apiClient;

  ClientHomeScreenRepository({required this.apiClient});
  Future<Response> fetchClientDetails() async {
    return await apiClient.getData('/api/client/details');
  }

  Future<Response> FetchClient(int id) async {
    return await apiClient.getData("/api/v1/staff/loanapp/getClient/$id");
  }
}
