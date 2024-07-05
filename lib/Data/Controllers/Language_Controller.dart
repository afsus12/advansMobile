import 'package:advans_app/Data/Controllers/LanguageCont.dart';
import 'package:advans_app/Models/ProspectModel.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  var currentLanguage = 'en'.obs;
  var uncompletedOper = new ProspectRequest(
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

  void switchLanguage() {
    if (currentLanguage.value == 'en') {
      LocalizationService().changeLocale('fr', 'FR');
      currentLanguage.value = 'fr';
    } else if (currentLanguage.value == 'fr') {
      LocalizationService().changeLocale('ar', 'AE');

      currentLanguage.value = 'ar';
    } else {
      LocalizationService().changeLocale('en', 'US');
      currentLanguage.value = 'en';
    }
  }
}
