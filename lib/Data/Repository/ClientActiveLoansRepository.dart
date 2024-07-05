import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:get/get.dart';

class ClientActiveLoansRepository extends GetxService {
  final ApiClient apiClient;

  ClientActiveLoansRepository({required this.apiClient});

  Future<Response> getActiveLoans(int id) async {
    return await apiClient.getData("/api/v1/loans/client/$id");
  }
}
