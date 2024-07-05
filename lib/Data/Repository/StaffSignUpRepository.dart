import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:get/get.dart';

class StaffSignUpRepository extends GetxService {
  final ApiClient apiClient;
  StaffSignUpRepository({required this.apiClient});
  Future<Response> Signup(Map body) async {
    return await apiClient.postData2("/api/v1/auth/cc/signup", body);
  }
}
