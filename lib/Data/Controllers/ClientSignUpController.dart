import 'dart:async';

import 'package:advans_app/Data/Repository/ClientSignUpRepository.dart';
import 'package:advans_app/Models/ProspectModel.dart';
import 'package:advans_app/Models/SignUpModel.dart';
import 'package:advans_app/routes/routes_guide.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Api/ApiClient.dart' as a;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClientSignUpController extends GetxController {
  void setContext(BuildContext ctx) {
    context = ctx;
  }

  final ClientSignUpReposiotry signUpRepo;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  var birthdate = new TextEditingController().obs;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConController = TextEditingController();
  var emailError = ''.obs;
  var SignUpKey = GlobalKey<FormState>();
  var codeKey = GlobalKey<FormState>();

  var codeError = ''.obs;
  var checkEmailError = ''.obs;
  var passwtogg2 = true.obs;
  var passwtogg1 = true.obs;
  var currentStep = 0.obs;
  var numeroClient = ''.obs;
  var dateNaissance = ''.obs;
  var otp = ''.obs;
  var username = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var start = 180.obs;
  var loading = false.obs;
  var prospect = UserRequest(
      cin: "",
      firstname: "",
      lastname: "",
      address: "",
      email: "",
      password: "",
      username: "",
      phone: "",
      roles: ["ROLE_CLIENT"]).obs;
  late BuildContext context;
  String? validateThese(String c1) {
    if (c1.isEmpty || c1 == null) {
      return AppLocalizations.of(context)!.mandatory_field;
    }
    return null;
  }

  String? validateUsername(String c1) {
    if (c1.isEmpty || c1 == null) {
      return AppLocalizations.of(context)!.mandatory_field;
    }
    return null;
  }

  String? validatePassword(String c1) {
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

  var textEditingCtrls = [
    new TextEditingController().obs,
    new TextEditingController().obs,
    new TextEditingController().obs,
    new TextEditingController().obs,
  ].obs;
  Timer? timer;

  void nextStep() {
    if (currentStep.value == 1 && start.value == 180) {
      startTimer();
    }
    if (currentStep.value < 3) {
      currentStep.value += 1;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value -= 1;
    }
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  late final TextEditingController c1;
  late final TextEditingController c2;
  late final TextEditingController c3;
  late final TextEditingController c4;

  ClientSignUpController({required this.signUpRepo});
  onDispose() {
    usernameController.dispose();

    passwordController.dispose();

    super.dispose();
  }

  bool isCorrectOTP(RxList<Rx<TextEditingController>> controllers) {
    for (var controller in controllers) {
      if (controller.value.text != '0') {
        return false;
      }
    }
    return true;
  }

  Future<void> checkCustomerCode(String cutomer) async {
    loading.value = true;
    update();

    try {
      final response = await signUpRepo.checkCustom(cutomer);
      if (response != null) {
        print('response ${response.body}');
        if (response.statusCode == 200) {
          print("200");
          print(response.body);

          prospect.value.address = response.body["address"];
          prospect.value.firstname = response.body["firstname"];
          prospect.value.lastname = response.body["lastname"];
          prospect.value.address = response.body["address"];
          prospect.value.email = response.body["email"];
          prospect.value.phone = response.body["phoneNumber"];
          currentStep.value++;

          Get.snackbar(
            AppLocalizations.of(context)!.success,
            AppLocalizations.of(context)!.operation_success,
          );
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

  Future<void> Signup(String username, String password) async {
    loading.value = true;
    update();

    try {
      final loginRequest = UserRequest(
          username: username,
          password: password,
          cin: prospect.value.cin,
          email: prospect.value.email,
          firstname: prospect.value.firstname,
          lastname: prospect.value.lastname,
          phone: prospect.value.phone,
          address: prospect.value.address,
          birthday: prospect.value.birthday);
      final response = await signUpRepo.Signup(loginRequest.toJson());
      if (response != null) {
        print('response ${response.body}');
        if (response.statusCode == 200) {
          print("200");
          currentStep.value++;
          Get.snackbar(AppLocalizations.of(context)!.success,
              AppLocalizations.of(context)!.operation_success,
              snackPosition: SnackPosition.BOTTOM);
          Get.offAllNamed(routesGuide.authScreenClient);
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
  /* 
    Future<void> checkEmail(String email) async {
    loading = true;

    update();
    try {
      Response response = await signUpRepo.ckeckEmail(email);
      if (response.statusCode == 200) {
        emailError.value = 'Votre email est correcte';

        var responseBody = response.body;
        print(responseBody);
        print('Votre email est valide');
        Get.toNamed(RouteHelper.checkCode);
      } else {
        if (response.statusCode == 404) {
          emailError.value = 'Veuillez vérifier votre email';

          print("L'e-mail n'a pas été trouvé.");
        } else if(response.statusCode == 400) {
          emailError.value = "l'émail a déja un mot de passe";
        }else{
          print("Une erreur s'est produite lors de la vérification de l'e-mail.");
        }
      }
    } catch (e) {
      print('Une erreur s\'est produite lors de la vérification de l\'e-mail : $e');
    }
    loading = false;
    update();
  }
  Future<void> checkEmailForPassword(String email) async {
    loading = true;
    update();
    try {
      Response response = await signRepo.checkEmailForPassword(email);
      if (response.statusCode == 200) {
        checkEmailError.value = 'Votre email est correcte';
        var responseBody = response.body;
        print(responseBody);
        Get.to(VerificationMDP());
     // Get.toNamed(RouteHelper.checkPwd);
      } else {
        if (response.statusCode == 404) {
          checkEmailError.value = 'Veuillez vérifier votre email';
          print("L'e-mail n'a pas été trouvé.");
        } else if(response.statusCode == 400) {
          checkEmailError.value = "ce émail n' a pas encore un mot de passe.";

          print("ce émail n' a pas encore un mot de passe.");
        }
      }
    } catch (e) {
      checkEmailError.value = "Une erreur s\'est produite lors de la vérification de l\'e-mail.";

      print('Une erreur s\'est produite lors de la vérification de l\'e-mail : $e');
    }
    loading = false;
    update();
  }

  Future<void> verifyCode( String email, String code) async {
    loading = true;
    update();
    try {
      Response response = await signRepo.verifyCode( email,code);
      if (response.statusCode == 200) {
        var responseBody = response.body;
        print(responseBody);
        codeError.value = 'Le code de vérification est correcte';
        print('Le code de vérification est correct.');
        Get.toNamed(RouteHelper.signUp);
      } else if(response.statusCode == 400){
        codeError.value = "Le code de vérification n'est pas correcte";
      } else {
        print("Une erreur s'est produite lors de la vérification du code");
      }
    } catch (e) {
      print('Une erreur s\'est produite lors de la vérification du code : $e');
      // Handle error
    }
    loading = false;
    update();
  }
  Future<void> verifyCodePwd( String email, String code) async {
    loading = true;
    update();
    try {
      Response response = await signRepo.verifyCode(email,code);
      if (response.statusCode == 200) {
        var responseBody = response.body;
        print(responseBody);
        codeError.value = 'Le code de vérification est correcte';
        print('Le code de vérification est correct.');
        Get.toNamed(RouteHelper.resetMdp);
      } else if(response.statusCode == 400){
        codeError.value = "Le code de vérification n'est pas correcte";
      } else {
        print("Une erreur s'est produite lors de la vérification du code");
      }
    } catch (e) {
      print('Une erreur s\'est produite lors de la vérification du code : $e');
      // Handle error
    }
    loading = false;
    update();
  }
  Future<void> register(String username, String phone, String password,
      String confirmPassword) async {

  }
  Future<void> updateProfile(String email,String username, String phone, String password, String confirmPassword) async {
    try {
      Response response = await signRepo.updateProfile(
        email,
        username,
        password,
        confirmPassword,
        phone,
      );
      if (response.statusCode == 200) {
        print("Informations de l'utilisateur mises à jour avec succès");
            Get.toNamed(RouteHelper.signIn);
      } else {
        print("Une erreur s'est produite lors de la mise à jour du profil");
      }
    } catch (e) {
      print('Une erreur s\'est produite lors de la mise à jour du profil : $e');
    }
  }

  Future<void> updatePassword(String email, String password, String confirmPassword) async {
    try {
      Response response = await signRepo.updatePassword(email, password, confirmPassword);
      if (response.statusCode == 200) {

        print("Profile updated successfully");
        Get.toNamed(RouteHelper.signIn);
      } else {
        print("Failed to update profile: ${response.statusText}");
      }
    } catch (e) {
      print("Error updating profile: $e");
    }
  } */
}
