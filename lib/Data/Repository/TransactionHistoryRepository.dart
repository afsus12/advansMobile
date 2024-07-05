import 'package:advans_app/Data/Api/ApiClient.dart';

import 'package:get/get.dart';

class TransactionHistoryRepository extends GetxService {
  final ApiClient apiClient;

  TransactionHistoryRepository({required this.apiClient});

  Future<Response> getTransactionHistory(
      int userCode, String transType, int page, int size) async {
    final queryParams = {
      'transtype': transType,
      'page': page.toString(),
      'size': size.toString(),
    };
    final endpoint = '/api/v1/client/transactions/$userCode';
    return await apiClient.getDataWithParams(endpoint,
        queryParameters: queryParams);
  }
}
