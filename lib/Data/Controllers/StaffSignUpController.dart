import 'package:advans_app/Data/Repository/StaffSignUpRepository.dart';
import 'package:advans_app/Models/SignUpModel.dart';
import 'package:advans_app/routes/routes_guide.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Api/ApiClient.dart' as a;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StaffSignUpController extends GetxController {
  final StaffSignUpRepository staffSignUpRepository;
  late BuildContext context;
  void setContext(BuildContext ctx) {
    context = ctx;
  }

  StaffSignUpController({required this.staffSignUpRepository});
  var emailError = ''.obs;
  var SignUpKey = GlobalKey<FormState>();
  var codeError = ''.obs;
  var showError = false.obs;
  var errormsg = "Bad Credentials".obs;
  var passwtogg2 = true.obs;
  var passwtogg1 = true.obs;
  var checkEmailError = ''.obs;
  var loading = false.obs;

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConController = TextEditingController();
  final TextEditingController cinController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController nomController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> Signup(String username, String password, String cinController,
      String email, String prenom, String nom, String phone) async {
    loading.value = true;
    update();

    try {
      final loginRequest = UserRequest(
        username: username,
        password: password,
        cin: cinController,
        email: email,
        firstname: prenom,
        lastname: nom,
        phone: phone,
        address: "",
      );
      final response =
          await staffSignUpRepository.Signup(loginRequest.toJson());
      if (response != null) {
        print('response ${response.body}');
        if (response.statusCode == 200) {
          print("200");
          Get.snackbar(
            AppLocalizations.of(context)!.success,
            AppLocalizations.of(context)!.operation_success,
          );
          Get.offAllNamed(routesGuide.signInStaff);
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

  String? validateUsername(String c1) {
    if (c1.isEmpty || c1 == null) {
      return AppLocalizations.of(context)!.mandatory_field;
    }
    return null;
  }

  String? validatePasswordConf(String c1) {
    if (c1.isEmpty || c1 == null) {
      return AppLocalizations.of(context)!.mandatory_field;
    }
    return null;
  }

  String? validateCin(String c1) {
    if (c1.isEmpty || c1 == null) {
      return AppLocalizations.of(context)!.mandatory_field;
    }
    return null;
  }

  String? validateEmail(String c1) {
    if (c1.isEmpty || c1 == null) {
      return AppLocalizations.of(context)!.mandatory_field;
    }
    return null;
  }

  String? validatePhone(String c1) {
    if (c1.isEmpty || c1 == null) {
      return AppLocalizations.of(context)!.mandatory_field;
    }
    return null;
  }

  String? validatePrenom(String c1) {
    if (c1.isEmpty || c1 == null) {
      return AppLocalizations.of(context)!.mandatory_field;
    }
    return null;
  }

  String? validateNom(String c1) {
    if (c1.isEmpty || c1 == null) {
      return AppLocalizations.of(context)!.mandatory_field;
    }
    return null;
  }

  String? validateConPassword(String c1, c2) {
    if (c2.isEmpty || c2 == null) {
      return AppLocalizations.of(context)!.mandatory_field;
    } else if (c1 != c2) {
      return AppLocalizations.of(context)!.password_dont_match;
    }
    return null;
  }

  String? validatePasword(String c1) {
    if (c1.isEmpty || c1 == null) {
      return AppLocalizations.of(context)!.mandatory_field;
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
