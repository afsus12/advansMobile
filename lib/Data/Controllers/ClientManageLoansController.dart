import 'package:advans_app/Data/Repository/ClientManageLoansRepository.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_storage/get_storage.dart';

class ClientManageLoansController extends GetxController {
  final ClientManageLoansRepository clientManageLoansRepository;
  late BuildContext context;
  var loading = false.obs;
  var canDemand = true.obs;
  var userCode = 0;
  final box = GetStorage();
  void setContext(BuildContext ctx) {
    context = ctx;
  }

  ClientManageLoansController({required this.clientManageLoansRepository});

  @override
  void onInit() async {
    // Example initialization check
    userCode = box.read("USERCODE");
    await canApply(userCode);
    super.onInit();
  }

  Future<void> canApply(int id) async {
    loading.value = true;
    update();

    try {
      final response = await clientManageLoansRepository.checkHeCanDemande(id);
      if (response != null) {
        print('response ${response.body}');
        if (response.statusCode == 200) {
          print("200");
          print(response.body);
          canDemand.value = response.body;
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

  // Example method accessing repository
  void fetchData(int id) {
    clientManageLoansRepository.checkHeCanDemande(id).then((response) {
      // Handle response
    }).catchError((error) {
      // Handle error
    });
  }
}
