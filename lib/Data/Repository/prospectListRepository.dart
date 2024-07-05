import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:get/get.dart';

class ProspectListRepository extends GetxService {
  final ApiClient apiClient;

  ProspectListRepository({required this.apiClient});

  Future<Response> getProspects(int userCode, String firstname, String lastname,
      String customer, int page, int size) async {
    final queryParams = {
      'firstname': firstname,
      'lastname': lastname,
      'customer': customer,
      'page': page.toString(),
      'size': size.toString(),
    };
    final endpoint = '/api/v1/staff/prospect/$userCode';
    return await apiClient.getDataWithParams(endpoint,
        queryParameters: queryParams);
  }
}
