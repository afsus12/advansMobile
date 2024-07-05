import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:get/get.dart';

class StaffSignInRepository extends GetxService {
  final ApiClient apiClient;
  StaffSignInRepository({required this.apiClient});

  Future<Response> login(Map body) async {
    return await apiClient.postData2("/api/v1/auth/cc/signin", body);
  }
}
