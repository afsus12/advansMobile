import 'dart:io';

import 'package:advans_app/Data/Repository/ClientSignInRepository.dart';
import 'package:advans_app/Data/Repository/LoanApplicationRepository.dart';
import 'package:advans_app/Models/LoanApplicationModel.dart';
import 'package:advans_app/Models/LoginModel.dart';
import 'package:advans_app/routes/routes_guide.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;
import '../Api/ApiClient.dart' as a;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:file_picker/file_picker.dart';

class ClientLonaApplicationController extends GetxController {
  late BuildContext context;
  void setContext(BuildContext ctx) {
    context = ctx;
  }

  final box = GetStorage();
  var userId = 0.obs;
  var fullname = TextEditingController().obs;
  var emailEd = TextEditingController().obs;
  var phoneEd = TextEditingController().obs;
  var cinEd = TextEditingController().obs;
  var name = "".obs;
  var lname = "".obs;
  var loanKey = GlobalKey<FormState>();

  @override
  void onInit() async {
    // TODO: implement onInit
    userId.value = box.read("USERCODE");
    int id = userId.value;
    await fetchClient(id);
    super.onInit();
  }

  var codeError = ''.obs;
  var checkEmailError = ''.obs;
  var passwtogg2 = true.obs;
  var passwtogg1 = true.obs;
  var currentStep = 0.obs;
  var numeroClient = ''.obs;
  var dateNaissance = ''.obs;
  var otp = ''.obs;
  var username = ''.obs;
  var AcitvityController = TextEditingController().obs;
  var password = ''.obs;
  var email = ''.obs;
  var cin = ''.obs;
  var customerId = ''.obs;
  var birthday = ''.obs;
  var phone = ''.obs;
  var confirmPassword = ''.obs;
  var showSteps = false.obs;
  var showDetails = false.obs;
  var currentCatIndex = 0.obs;
  var start = 180.obs;
  var loading = false.obs;
  final LoanApplicationRepository loanApplicationRepository;
  var emailError = ''.obs;
  var SignInKey = GlobalKey<FormState>();
  var Step1Key = GlobalKey<FormState>();
  var Step2Key = GlobalKey<FormState>();
  var Step3key = GlobalKey<FormState>();

  var showError = false.obs;
  var errormsg = "Bad Credentials".obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController nationalite = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController actvityType = TextEditingController();
  final TextEditingController activityAdresse = TextEditingController();
  final TextEditingController activityexperienceDuration =
      TextEditingController();
  final TextEditingController governorat = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController loanpurpose = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var pickedFiles = <PlatformFile>[].obs;
  var isLoading = false.obs;
  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png'],
      allowMultiple: true,
    );

    if (result != null) {
      pickedFiles.value = result.files;
    }
  }

  ClientLonaApplicationController({required this.loanApplicationRepository});
  String? validateThese(String c1) {
    if (c1.isEmpty || c1 == null) {
      return AppLocalizations.of(context)!.mandatory_field;
    }
    return null;
  }

  String setVariableList(int index, List<String> produitList) {
    return produitList[index];
  }

  Future<void> sendLoanApplication(
    String fullname,
    String cin,
    int age,
    String phone,
    String nationalite,
    String acivitytype,
    String activityAdresse,
    String acitivtyexperienceduration,
    String governorat,
    String product,
    double amount,
    String loanpurpose,
    List<PlatformFile> files,
  ) async {
    loading.value = true;
    update();

    try {
      List<File> files2 =
          files.map((platformFile) => File(platformFile.path!)).toList();
      final loginRequest = LoanApplication(
        nationalite: nationalite,
        age: age,
        clientId: userId.value,
        experienceDuration: acitivtyexperienceduration,
        loanPurpose: loanpurpose,
        productName: product,
        governorat: governorat,
        activityAdresse: activityAdresse,
        fullName: fullname,
        customer: customerId.value,
        activityType: acivitytype,
        previousMicrofinanceInstitution: "",
        requestedCreditAmount: amount,
      );
      final response =
          await loanApplicationRepository.createLoanApp(loginRequest, files2);
      if (response != null) {
        print('response ${response.body}');
        if (response.statusCode == 200) {
          print("200");

          Get.snackbar(
            AppLocalizations.of(context)!.success,
            AppLocalizations.of(context)!.operation_success,
          );

          Get.offAllNamed(routesGuide.homeScreenClient);
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

  Future<void> fetchClient(int id) async {
    loading.value = true;
    update();

    try {
      final response = await loanApplicationRepository.FetchClient(id);
      if (response != null) {
        print('response ${response.body}');
        if (response.statusCode == 200) {
          print("200");
          print(response.body);

          email.value = response.body["email"];
          name.value = response.body["firstname"];
          lname.value = response.body["lastname"];
          customerId.value = response.body["customer"];
          cin.value = response.body["cin"];
          birthday.value = response.body["birthday"] != null
              ? response.body["birthday"]
              : "";
          phone.value = response.body["phone"];

          fullname.value.text = name.value + " " + lname.value;
          emailEd.value.text = email.value;
          cinEd.value.text = cin.value;
          phoneEd.value.text = phone.value;

          phone.value = response.body["phone"];
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

/*   Future<void> login(String username, String password) async {
    loading.value = true;
    update();

    try {
      final loginRequest = LoginRequest(username: username, password: password);
      final response =
          await clientSignInRepository.login(loginRequest.toJson());

      if (response != null) {
        print('response ${response.body}');

        if (response.statusCode == 200) {
          print("200");
          final token = response.body['jwt'];
          final firstname = response.body['firstname'];
          final lastname = response.body['lastname'];
          final userCode = response.body['id'];
          final roles = response.body['roles'];
          print('roles: $roles');
          print('token : $token');
          // Check if userCode is not null and not zero
          if (roles != null && roles.contains('ROLE_CLIENT')) {
            if (userCode != null && userCode != 0) {
              box.write('TOKEN', token);
            }

            box.write('NAME', firstname);
            box.write('LNAME', lastname);
            box.write('USERCODE', userCode);
            Get.find<a.ApiClient>().updateHeader(token);
            Get.offNamed(routesGuide.homeScreenClient);
          } else {
            Get.snackbar(AppLocalizations.of(context)!.error,
                AppLocalizations.of(context)!.error_not_authorized,
                snackPosition: SnackPosition.BOTTOM);
          }
        } else {
          Get.snackbar(AppLocalizations.of(context)!.error,
              AppLocalizations.of(context)!.verify_details,
              snackPosition: SnackPosition.BOTTOM);

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
  } */
}
