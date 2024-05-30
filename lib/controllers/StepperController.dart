import 'package:get/get.dart';
import 'dart:async';

class StepperController extends GetxController {
  var currentStep = 0.obs;
  var numeroClient = ''.obs;
  var dateNaissance = ''.obs;
  var otp = ''.obs;
  var username = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var start = 180.obs;
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
}
