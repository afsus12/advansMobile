import 'dart:convert';

import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:advans_app/Models/PayMilestoneDTO.dart';

import 'package:get/get.dart';

class RepaymentMilestonesRepository extends GetxService {
  final ApiClient apiClient;

  RepaymentMilestonesRepository({required this.apiClient});

  Future<Response> getRepaymentMilestones(int id, int page, int size) async {
    final queryParams = {'page': page.toString(), 'size': size.toString()};
    final endpoint = '/api/v1/milestones/loan/$id';
    return await apiClient.getDataWithParams(endpoint,
        queryParameters: queryParams);
  }

  Future<bool> payMilestone(int id, PayMilestoneDTO request) async {
    final response = await apiClient.postData(
      "/api/v1/milestones/payMilestone/$id",
      json.encode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to pay milestone: ${response.body}');
    }
  }
}
