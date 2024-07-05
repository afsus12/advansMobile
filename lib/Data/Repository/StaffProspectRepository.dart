import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:get/get.dart';

class StaffProspectRepository extends GetxService {
  final ApiClient apiClient;
  StaffProspectRepository({required this.apiClient});

  Future<Response> createProspect(Map body) async {
    return await apiClient.postData("/api/v1/staff/prospect/", body);
  }
}
