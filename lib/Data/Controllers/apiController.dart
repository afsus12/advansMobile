import 'package:advans_app/Data/Api/ApiClient.dart';
import 'package:advans_app/Data/Controllers/Language_Controller.dart';
import 'package:advans_app/Utils/Constants/Constanst.dart';
import 'package:get/get.dart';

Future<void> init() async {
//TODO YOU SHOULD INITIALIZE THE API CLIENT WHEN THE APP STARTS
  Get.lazyPut(() => ApiClient(appBaseUrl: Constants.baseUrl));
  Get.lazyPut(() => LocaleController());

// USE BINDING FOR THE REST
}
