import 'package:advans_app/Data/Repository/StaffSignInRepository.dart';
import 'package:advans_app/Models/LoginModel.dart';
import 'package:advans_app/routes/routes_guide.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Api/ApiClient.dart' as a;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StaffSignInController extends GetxController {
  final StaffSignInRepository staffSignInRepository;
  late BuildContext context;
  void setContext(BuildContext ctx) {
    context = ctx;
  }

  StaffSignInController({required this.staffSignInRepository});
  var emailError = ''.obs;
  var SignInKey = GlobalKey<FormState>();
  var codeError = ''.obs;
  var showError = false.obs;
  var errormsg = "Bad Credentials".obs;
  var passwtogg2 = true.obs;
  var checkEmailError = ''.obs;
  var loading = false.obs;
  final box = GetStorage();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  onDispose() {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  String? validatePasswordlen(String c1) {
    if (c1.isEmpty || c1 == null) {
      return AppLocalizations.of(context)!.mandatory_field;
    } else if (c1.length < 6) {
      return "minimum 6";
    }
    return null;
  }

  String? validateUsername(String c1) {
    if (c1.isEmpty || c1 == null) {
      return AppLocalizations.of(context)!.mandatory_field;
    }
    return null;
  }

  String? validatePasword(String c1) {
    if (c1.isEmpty || c1 == null) {
      return AppLocalizations.of(context)!.mandatory_field;
    }
    return null;
  }

  Future<void> login(String username, String password) async {
    loading.value = true;
    update();

    try {
      final loginRequest = LoginRequest(username: username, password: password);
      final response = await staffSignInRepository.login(loginRequest.toJson());
      if (response != null) {
        print('response ${response.body}');
        if (response.statusCode == 200) {
          print("200");
          final token = response.body['jwt'];
          final firstname = response.body['firstname'];
          final lastname = response.body['lastname'];
          final userCode = response.body['id'];
          final roles = response.body['roles'];
          print('token : $token');
          print(roles);
          if (roles != null && roles.contains('ROLE_CC')) {
            if (userCode != null && userCode != 0) {
              box.write('TOKEN', token);
            }
            box.write('TOKEN', token);
            box.write('NAME', firstname);
            box.write('LNAME', lastname);

            box.write('USERCODE', userCode);
            Get.find<a.ApiClient>().updateHeader(token);
            Get.offAllNamed(routesGuide.homeScreenStaff);
          } else {
            Get.snackbar(AppLocalizations.of(context)!.error,
                AppLocalizations.of(context)!.error_not_authorized,
                snackPosition: SnackPosition.BOTTOM);
          }
        } else {
          Get.snackbar(
            AppLocalizations.of(context)!.error,
            AppLocalizations.of(context)!.verify_details,
          );
          if (response.statusCode == 401) {
            print('Unauthorized');
          } else {
            print('Error: ${response.statusCode}');
          }
        }
      } else {
        print('Server error: Response is null');
      }
    } catch (e) {
      print('Exception during login: $e');
    }

    loading.value = false;
    update();
  }
}
