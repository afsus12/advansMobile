import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:get/get.dart';

class ClientTransferRepository extends GetxService {
  final ApiClient apiClient;
  ClientTransferRepository({required this.apiClient});
  Future<Response> TransferMoney(Map body) async {
    return await apiClient.postData("/api/v1/client/wallet/addBalance", body);
  }
}
