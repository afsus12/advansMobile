import 'dart:convert';

import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:advans_app/Models/LoginModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ClientSignInRepository extends GetxService {
  final ApiClient apiClient;
  ClientSignInRepository({required this.apiClient});

  Future<Response> login(Map body) async {
    return await apiClient.postData2("/api/v1/auth/client/signin", body);
  }

/* 
  Future<http.Response> logind(LoginRequest data) {
    return http.post(Uri.parse('${apiClient.baseUrl}/authentication/signin'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data.toJson()));
  } */
}
