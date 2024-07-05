import 'dart:async';

import 'package:advans_app/Data/Repository/ClientTransferRepository.dart';
import 'package:advans_app/Models/AddBalanceDTO.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ClientTransferController extends GetxController {
  final ClientTransferRepository clientTransferRepository;

  ClientTransferController({required this.clientTransferRepository});
  var otp = ''.obs;
  final box = GetStorage();
  var selectedImageIndex = 0.obs;
  var start = 180.obs;
  var loading = false.obs;
  var userId = 0.obs;
  var textEditingCtrls = [
    new TextEditingController().obs,
    new TextEditingController().obs,
    new TextEditingController().obs,
    new TextEditingController().obs,
  ].obs;

  Future<void> addBlance(double amount) async {
    loading.value = true;
    update();

    try {
      final log = AddBalanceDTO(amount: amount, clientId: userId.value);
      final response =
          await clientTransferRepository.TransferMoney(log.toJson());
      if (response != null) {
        print('response ${response.body}');
        if (response.statusCode == 200) {
          print("200");
          print('Success: ${response.statusCode}');
          print(response.body);
        } else {
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
      print('Exception during Adding: $e');
    }

    loading.value = false;
    update();
  }

  bool isCorrectOTP(RxList<Rx<TextEditingController>> controllers) {
    for (var controller in controllers) {
      if (controller.value.text != '0') {
        return false;
      }
    }
    return true;
  }

  final TextEditingController amountController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
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

  Timer? timer;
  @override
  void onInit() {
    int init = -1;
    userId.value = box.read("USERCODE");

    selectedImageIndex.value = init;
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  void selectImage(int index) {
    if (selectedImageIndex.value == index) {
      selectedImageIndex.value = -1; // Deselect if already selected
    } else {
      selectedImageIndex.value = index; // Select the image at index
    }
    update(); // Notify listeners of the state change
  }
}
