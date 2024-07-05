import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:get/get.dart';

class TrackLoanApplicationsRepository extends GetxService {
  final ApiClient apiClient;
  TrackLoanApplicationsRepository({required this.apiClient});

  Future<Response> fetchApplications(
      int id, String status, int page, int size) async {
    final queryParams = {
      'status': status,
      'page': page.toString(),
      'size': size.toString(),
    };
    final endpoint = '/api/v1/staff/loanapp/getAllClient/$id';
    return await apiClient.getDataWithParams(endpoint,
        queryParameters: queryParams);
  }
}
