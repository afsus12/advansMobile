import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:get/get.dart';

class ClientSignUpReposiotry extends GetxService {
  final ApiClient apiClient;
  ClientSignUpReposiotry({required this.apiClient});

  Future<Response> Signup(Map body) async {
    return await apiClient.postData2("/api/v1/auth/client/signup", body);
  }

  Future<Response> ckeckEmail(String email) async {
    return await apiClient.getData("/api/checkEmail/$email");
  }

  Future<Response> checkEmailForPassword(String email) async {
    return await apiClient.getData("/api/checkEmailForPassword/$email");
  }

  Future<Response> verifyCode(String email, String code) async {
    return await apiClient.getData("/api/verifyCode/$email/$code");
  }

  Future<Response> verifyCodePwd(String email, String code) async {
    return await apiClient.getData("/api/verifyCode/$email/$code");
  }

  Future<Response> checkCustom(String custom) async {
    return await apiClient.getData("/api/v1/auth/cc/$custom", headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    });
  }

  Future<Response> updateProfile(String email, String userName, String password,
      String confirmPassword, String numTel) async {
    try {
      Map<String, dynamic> body = {
        "user_name": userName,
        "password": password,
        "password_confirmation": confirmPassword,
        "numTel": numTel
      };
      Response response =
          await apiClient.putData("/api/updateProfile/$email", body);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> updatePassword(
      String email, String password, String confirmPassword) async {
    try {
      Map<String, dynamic> body = {
        "password": password,
        "password_confirmation": confirmPassword,
      };
      Response response =
          await apiClient.putData("/api/updatePassword/$email", body);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
