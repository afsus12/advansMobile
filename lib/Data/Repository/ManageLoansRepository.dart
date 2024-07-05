import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:advans_app/Models/LoanApplicationGloablModel.dart';
import 'package:get/get.dart';

class ManageLoansRepository extends GetxService {
  final ApiClient apiClient;
  ManageLoansRepository({required this.apiClient});

  Future<List<LoanApplicationGlobalModel>> fetchLoanListDetails(
      int id, String status, int page, int size) async {
    final queryParams = {
      'status': status,
      'page': page.toString(),
      'size': size.toString(),
    };
    final response = await apiClient.getDataWithParams(
        '/api/v1/staff/loanapp/getAll/$id',
        queryParameters: queryParams);
    if (response.statusCode == 200) {
      List<dynamic> body = response.body;
      print(body);
      return body
          .map((dynamic item) => LoanApplicationGlobalModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load loan applications');
    }
  }
}
