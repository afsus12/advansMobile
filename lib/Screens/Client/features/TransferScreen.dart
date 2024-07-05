import 'package:advans_app/Data/Controllers/ClientTransferController.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/CustomAppBar.dart';
import 'package:advans_app/Widgets/OtpWidget.dart';
import 'package:advans_app/Widgets/buttonwithicon.dart';
import 'package:advans_app/Widgets/drawer.dart';
import 'package:advans_app/Widgets/dropdown.dart';
import 'package:advans_app/Widgets/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slide_countdown/slide_countdown.dart';

class TransferScreen extends GetView<ClientTransferController> {
  TransferScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  void _showConfirmationBottomSheet(
      BuildContext context, double amount, String phone) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return MediaQuery(
          // Wrap with MediaQuery to access context size
          data: MediaQuery.of(context),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              padding: EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
              ),
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Confirm Transaction',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Verification Code has been sent to  Phone ' +
                        " \n +216 " +
                        phone,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      4,
                      (index) => OTPInput(
                        controller: controller.textEditingCtrls[index].value,
                        first: index == 0,
                        last: index == 3,
                        height: 50,
                        width: MediaQuery.of(context).size.width / 5,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SlideCountdown(
                      decoration: BoxDecoration(
                          color: MyColors.MainGreenColor,
                          borderRadius: BorderRadius.circular(30)),
                      duration: const Duration(minutes: 3),
                      separatorType: SeparatorType.title,
                      slideDirection: SlideDirection.up,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: controller.loading == false
                        ? ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  MyColors.Mainyellow),
                            ),
                            onPressed: () async {
                              bool check = controller
                                  .isCorrectOTP(controller.textEditingCtrls);
                              if (check == true) {
                                await controller.addBlance(amount);
                              } else {
                                print("false");
                              }
                              // Close bottom sheet
                            },
                            child: Text(
                              'Confirm',
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              color: MyColors.MainGreenColor,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _advancedDrawerController = AdvancedDrawerController();

    return AdvancedDrawer(
      drawer: SideMenu(),
      openRatio: 0.60,
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              MyColors.MainGreenColor,
              MyColors.MainGreenColor.withOpacity(0.8)
            ],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 0.0,
          //   ),
          // ],
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: CustomSliverAppBarDelegate(
                  minHeight: 80.h,
                  maxHeight: 80.h,
                  child: Appbar(
                    name: "",
                    paddingtop: 30,
                    title: "Mobile Money",
                    onPressedMenu: () {},
                    onPressedNotification: () {},
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  SizedBox(height: 20),
                  Obx(() => Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            buildSelectableImage(
                              "assets/images/Telecom.png",
                              "Tunisie Telecom",
                              controller.selectedImageIndex.value == 0,
                              () => controller.selectImage(0),
                            ),
                            SizedBox(width: 5),
                            buildSelectableImage(
                              "assets/images/ooredoo.png",
                              "Ooredoo",
                              controller.selectedImageIndex.value == 1,
                              () => controller.selectImage(1),
                            ),
                            SizedBox(width: 5),
                            buildSelectableImage(
                              "assets/images/orange.png",
                              "Orange",
                              controller.selectedImageIndex.value == 2,
                              () => controller.selectImage(2),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      SizedBox(
                        width: ScreenUtil().screenWidth * 0.6,
                        child: Myinput(
                          currency: '+216',
                          labelText: "Phone Number",
                          controller: controller.phoneController,
                          icon: Icons.phone,
                          keyboardType: TextInputType.number,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Phone number is required';
                            }
                            if (controller.selectedImageIndex.value == 0) {
                              if (value!.length != 8 ||
                                  !(value.startsWith('9') ||
                                      value.startsWith('7'))) {
                                return 'Invalid phone number';
                              }
                            } else if (controller.selectedImageIndex.value ==
                                1) {
                              if (value!.length != 8 ||
                                  !value.startsWith('2')) {
                                return 'Invalid phone number';
                              }
                            } else if (controller.selectedImageIndex.value ==
                                2) {
                              if (value!.length != 8 ||
                                  !value.startsWith('5')) {
                                return 'Invalid phone number';
                              }
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 12),
                      SizedBox(
                        width: ScreenUtil().screenWidth * 0.6,
                        child: Myinput(
                            labelText: "Amount",
                            currency: "TND",
                            keyboardType: TextInputType.number,
                            controller: controller.amountController,
                            icon: Icons.money),
                      ),
                      SizedBox(height: 12),
                      SizedBox(
                        width: 150,
                        child: ButtonWithIcon(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _showConfirmationBottomSheet(
                                  context,
                                  double.parse(
                                      controller.amountController.value.text),
                                  controller.phoneController.value.text);
                            }
                          },
                          text: "Add Balance",
                          mainColor: MyColors.MainGreenColor,
                          textcolor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSelectableImage(
    String imagePath,
    String label,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 140,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected
              ? MyColors.SecondGreenColor.withOpacity(.7)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? MyColors.Mainyellow : MyColors.SecondGreenColor,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imagePath,
              height: 80,
              width: 80,
            ),
            SizedBox(height: 10),
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
