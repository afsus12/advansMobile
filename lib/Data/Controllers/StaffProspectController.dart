import 'package:advans_app/Data/Controllers/Language_Controller.dart';
import 'package:advans_app/Data/Repository/StaffProspectRepository.dart';
import 'package:advans_app/Models/ProspectModel.dart';
import 'package:advans_app/routes/routes_guide.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StaffProspectController extends GetxController {
  final StaffProspectRepository staffProspectRepository;
  late BuildContext context;
  void setContext(BuildContext ctx) {
    context = ctx;
  }

  StaffProspectController({required this.staffProspectRepository});
  final LocaleController appController = Get.find<LocaleController>();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController postController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final TextEditingController AcitvityController = TextEditingController();
  final TextEditingController cinController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  var userCode = "".obs;
  final box = GetStorage();
  var prospectKey = GlobalKey<FormState>();
  RxList<bool> isSelected2 = <bool>[true, false].obs;
  RxList<bool> isSelected4 = <bool>[true, false].obs;
  var loading = false.obs;
  var dropController = new TextEditingController().obs;
  var textEditingCtrls = [
    new TextEditingController().obs,
    new TextEditingController().obs,
    new TextEditingController().obs,
    new TextEditingController().obs,
  ].obs;

  String? validateThese(String c1) {
    if (c1.isEmpty || c1 == null) {
      return AppLocalizations.of(context)!.mandatory_field;
    }
    return null;
  }

  var Otp = new TextEditingController().obs;
  var index = 0.obs;

  var gender = new TextEditingController().obs;

  Future<void> addProspect(
      String fname,
      String lname,
      String address,
      String gender,
      String title,
      String userCode,
      String phoneNumber,
      String email,
      String branch,
      String subjob,
      String activity,
      String job,
      String cin) async {
    loading.value = true;
    update();

    try {
      final loginRequest = ProspectRequest(
          firstname: fname,
          lastname: lname,
          address: address,
          gender: gender,
          title: title,
          email: email,
          userCode: int.parse(userCode),
          phoneNumber: phoneNumber,
          subJobOfTheHolder: subjob,
          branch: branch,
          fieldOfActivity: activity,
          jobOfTheHolder: job,
          cin: cin);
      final response =
          await staffProspectRepository.createProspect(loginRequest.toJson());
      if (response != null) {
        print('response ${response.body}');
        if (response.statusCode == 200) {
          print("200");
          final token = response.body['jwt'];
          final firstname = response.body['firstname'];
          final lastname = response.body['lastname'];
          final userCode = response.body['id'];
          final customer = response.body['customer'];
          appController.uncompletedOper.value = loginRequest;
          appController.uncompletedOper.value.customer = customer;
          print(appController.uncompletedOper.value.customer);
          Get.snackbar(
            AppLocalizations.of(context)!.success,
            AppLocalizations.of(context)!.operation_success,
          );

          Get.offAllNamed(routesGuide.homeScreenStaff);
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
  void onInit() {
    gender.value.text = "Male";
    userCode.value = box.read("USERCODE").toString();

    // TODO: implement onInit
    super.onInit();
  }
}
