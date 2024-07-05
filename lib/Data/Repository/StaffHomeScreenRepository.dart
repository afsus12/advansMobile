import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:get/get.dart';

class StaffHomeScreenRepository extends GetxService {
  final ApiClient apiClient;
  StaffHomeScreenRepository({required this.apiClient});
  Future<Response> fetchStaffDetails() async {
    return await apiClient.getData('/api/staff/details');
  }
}
