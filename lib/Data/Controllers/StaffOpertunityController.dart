import 'package:advans_app/Data/Controllers/Language_Controller.dart';
import 'package:advans_app/Data/Repository/StaffOpertunityRepository.dart';
import 'package:advans_app/Models/OpertunityModel.dart';
import 'package:advans_app/Models/ProspectModel.dart';
import 'package:advans_app/routes/routes_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StaffOpertunityController extends GetxController {
  final StaffOpertunityRepository staffOpertunityRepository;
  late BuildContext context;
  void setContext(BuildContext ctx) {
    context = ctx;
  }

  StaffOpertunityController({required this.staffOpertunityRepository});
  final LocaleController appController = Get.find<LocaleController>();
  var operKey = GlobalKey<FormState>();
  var dateController = TextEditingController().obs;
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController designationController = TextEditingController();

  var loading = false.obs;
  var userCode = "".obs;
  var show = false.obs;
  final box = GetStorage();
  String? validateThese(String c1) {
    if (c1.isEmpty || c1 == null) {
      return AppLocalizations.of(context)!.mandatory_field;
    }
    return null;
  }

  var prospect = new ProspectRequest(
          firstname: "",
          lastname: "",
          address: "",
          gender: "",
          title: "",
          userCode: 0,
          phoneNumber: "",
          email: "",
          subJobOfTheHolder: "",
          branch: "",
          fieldOfActivity: "",
          jobOfTheHolder: "")
      .obs;

  Future<void> addOpertunity(String customer, String subject, String project,
      String designation, String date) async {
    loading.value = true;
    update();

    try {
      final opperRequest = OpertunityRequest(
          subject: subject,
          customer: customer,
          userCode: userCode.value,
          project: project,
          date: date,
          designation: designation);
      final response = await staffOpertunityRepository.CreateOppertunity(
          opperRequest.toJson());
      if (response != null) {
        print('response ${response.body}');
        if (response.statusCode == 200) {
          print("200");

          appController.uncompletedOper.close();
          appController.uncompletedOper = ProspectRequest(
                  firstname: "",
                  lastname: "",
                  address: "",
                  gender: "",
                  title: "",
                  userCode: 0,
                  email: "",
                  phoneNumber: "",
                  subJobOfTheHolder: "",
                  branch: "",
                  fieldOfActivity: "",
                  jobOfTheHolder: "")
              .obs;

          Get.snackbar(
            AppLocalizations.of(context)!.success,
            AppLocalizations.of(context)!.operation_success,
          );

          Get.offAllNamed(routesGuide.homeScreenStaff);
        } else {
          Get.snackbar(
            AppLocalizations.of(context)!.error,
            AppLocalizations.of(context)!.operation_failed,
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
    dateController.close();
    prospect.close();
    subjectController.dispose();
    designationController.dispose();

    super.dispose();
  }

  @override
  void onInit() {
    if (appController.uncompletedOper.value.firstname != "") {
      prospect.value = appController.uncompletedOper.value;
      show.value = true;
    }

    userCode.value = box.read("USERCODE").toString();
    // TODO: implement onInit
    super.onInit();
  }
}
