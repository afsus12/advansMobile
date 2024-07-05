import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:get/get.dart';

class StaffOpertunityRepository extends GetxService {
  final ApiClient apiClient;
  StaffOpertunityRepository({required this.apiClient});
  Future<Response> CreateOppertunity(Map body) async {
    return await apiClient.postData("/api/v1/staff/opportunity/", body);
  }
}
