import 'package:advans_app/Data/Controllers/ClientSignUpController.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/OtpWidget.dart';
import 'package:advans_app/Widgets/big_text.dart';
import 'package:advans_app/Widgets/buttonwithicon.dart';
import 'package:advans_app/Widgets/inputfield.dart';
import 'package:advans_app/commons/customShapes/Curvededge.dart';
import 'package:advans_app/commons/customShapes/Tcontainer.dart';
import 'package:advans_app/controllers/StepperController.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupScreen extends GetView<ClientSignUpController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setContext(context);
    Widget _buildContentBasedOnStatus(int status) {
      switch (status) {
        case 0:
          return Form(
            key: controller.codeKey,
            child: Column(
              children: [
                SizedBox(
                    width: ScreenUtil.defaultSize.width * 0.9,
                    child: Myinput(
                        aligncenter: true,
                        icon: Icons.person,
                        validate: (p) => controller.validateThese(p!),
                        keyboardType: TextInputType.number,
                        controller: controller.customerController,
                        labelText: AppLocalizations.of(context)!
                            .accountIdPlaceholder)),
                SizedBox(
                  height: 15,
                ),
                Obx(() => GestureDetector(
                      onTap: () async {
                        DateTime? pickdate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1990),
                            lastDate: DateTime(2024));
                        print(pickdate);
                        controller.birthdate.value.text =
                            DateFormat("yyyy-MM-dd").format(pickdate!);
                      },
                      child: SizedBox(
                        width: ScreenUtil.defaultSize.width * 0.9,
                        child: Myinput(
                          aligncenter: true,
                          enabled: false,
                          controller: controller.birthdate.value,
                          labelText: AppLocalizations.of(context)!.birthday,
                          validate: (p) => controller.validateThese(p!),
                          icon: Icons.calendar_month,
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                ButtonWithIcon(
                  width: 300,
                  height: 50,
                  onPressed: () {
                    bool valid = controller.codeKey.currentState!.validate();
                    if (valid) {
                      controller.checkCustomerCode(
                          controller.customerController.value.text);
                    }
                  },
                  text: AppLocalizations.of(context)!.proceed,
                  fontSize: 20,
                  mainColor: MyColors.MainGreenColor,
                  textcolor: Colors.white,
                )
              ],
            ),
          );
        case 1:
          return Column(
            children: <Widget>[
              Text(AppLocalizations.of(context)!.sms_sent_to_phone),
              SizedBox(
                height: 20,
              ),
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
              SizedBox(
                height: 10,
              ),
              SlideCountdown(
                decoration: BoxDecoration(
                    color: MyColors.MainGreenColor,
                    borderRadius: BorderRadius.circular(30)),
                duration: const Duration(minutes: 3),
                separatorType: SeparatorType.title,
                slideDirection: SlideDirection.up,
              ),
              SizedBox(
                height: 10,
              ),
              ButtonWithIcon(
                width: 250,
                height: 45,
                onPressed: () {
                  var check =
                      controller.isCorrectOTP(controller.textEditingCtrls);
                  if (check) {
                    Get.snackbar(AppLocalizations.of(context)!.success,
                        AppLocalizations.of(context)!.operation_success,
                        snackPosition: SnackPosition.BOTTOM);
                    controller.currentStep++;
                  } else {
                    Get.snackbar(AppLocalizations.of(context)!.error,
                        AppLocalizations.of(context)!.incorrect_code,
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
                text: AppLocalizations.of(context)!.verify,
                fontSize: 20,
                mainColor: MyColors.MainGreenColor,
                textcolor: Colors.white,
              )
            ],
          );
        case 2:
          return Form(
            key: controller.SignUpKey,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width.w * 0.90.w,
                  child: Myinput(
                      controller: controller.usernameController,
                      icon: Icons.person,
                      height: 10,
                      validate: (v) => controller.validateUsername(v!),
                      labelText:
                          AppLocalizations.of(context)!.placeholderUsername),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width.w * 0.90.w,
                    child: Obx(() => Myinput(
                        height: 10,
                        controller: controller.passwordController,
                        icon: Icons.lock,
                        validate: (v) => controller.validatePassword(v!),
                        obscureText: controller.passwtogg2.value,
                        Suffixicon: Icons.visibility,
                        Suffixiconoff: Icons.visibility_off,
                        suffixiconfun: () {
                          controller.passwtogg2.value =
                              !controller.passwtogg2.value;
                        },
                        labelText: AppLocalizations.of(context)!
                            .confirmPasswordPlaceholder))),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width.w * 0.90.w,
                    child: Obx(() => Myinput(
                        height: 10,
                        controller: controller.passwordConController,
                        icon: Icons.lock,
                        obscureText: controller.passwtogg1.value,
                        validate: (p) => controller.validateConPassword(
                            controller.passwordController.text,
                            controller.passwordConController.text),
                        Suffixicon: Icons.visibility,
                        Suffixiconoff: Icons.visibility_off,
                        suffixiconfun: () {
                          controller.passwtogg1.value =
                              !controller.passwtogg1.value;
                        },
                        labelText: AppLocalizations.of(context)!
                            .confirmPasswordPlaceholder))),
                SizedBox(
                  height: 8,
                ),
                ButtonWithIcon(
                  width: 350,
                  height: 45,
                  onPressed: () {
                    bool valid = controller.SignUpKey.currentState!.validate();
                    if (valid) {
                      controller.Signup(
                          controller.usernameController.value.text,
                          controller.passwordController.value.text);
                    }
                  },
                  text: AppLocalizations.of(context)!.create_account,
                  fontSize: 20,
                  mainColor: MyColors.MainGreenColor,
                  textcolor: Colors.white,
                )
              ],
            ),
          );
        default:
          return Text(AppLocalizations.of(context)!.unknown_status,
              style: TextStyle(color: Colors.grey, fontSize: 24));
      }
    }

/*     List<Step> _getSteps() {
      return [
        Step(
          title: Text('Step 1'),
          content: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Numero Client'),
                onChanged: (value) {
                  controller.numeroClient.value = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Date de Naissance'),
                onChanged: (value) {
                  controller.dateNaissance.value = value;
                },
              ),
            ],
          ),
          isActive: controller.currentStep.value >= 0,
        ),
        Step(
          title: Text('Step 2'),
          content: Column(
            children: <Widget>[
              Text('An SMS has been sent to phone 25******'),
              SlideCountdown(
                decoration: BoxDecoration(
                    color: MyColors.MainGreenColor,
                    borderRadius: BorderRadius.circular(30)),
                duration: const Duration(minutes: 3),
                separatorType: SeparatorType.title,
                slideDirection: SlideDirection.up,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Enter OTP'),
                onChanged: (value) {
                  controller.otp.value = value;
                },
              ),
            ],
          ),
          isActive: controller.currentStep.value >= 1,
        ),
        Step(
          title: Text('Step 3'),
          content: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Username'),
                onChanged: (value) {
                  controller.username.value = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (value) {
                  controller.password.value = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                onChanged: (value) {
                  controller.confirmPassword.value = value;
                },
              ),
            ],
          ),
          isActive: controller.currentStep.value >= 2,
        ),
        Step(
          title: Text('Success'),
          content: Column(
            children: <Widget>[
              Text('You have successfully completed the steps!'),
            ],
          ),
          isActive: controller.currentStep.value >= 3,
        ),
      ];
    } */

    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ClipPath(
        clipper: CurvedEdge(),
        child: Container(
          color: MyColors.MainGreenColor,
          padding: EdgeInsets.all(0),
          child: SizedBox(
            height: 360,
            child: Stack(children: [
              Positioned(
                top: -150,
                right: -250,
                child: Tcontainer(
                  backgroundcolor: Colors.white70.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: Tcontainer(
                  backgroundcolor: Colors.white60.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 170,
                left: -140,
                child: Tcontainer(
                  width: 390,
                  height: 130,
                  raduis: 80,
                  backgroundcolor: Colors.white,
                ),
              ),
              Positioned(
                top: 200,
                left: 15,
                child: SvgPicture.asset(
                  "assets/images/logo.svg",
                  fit: BoxFit.cover,
                  width: 200,
                ),
              )
            ]),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20),
        child: BigText(
          text: AppLocalizations.of(context)!.textSignupButton,
          color: Colors.black,
          size: 25,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          children: [
            Obx(() {
              return EasyStepper(
                lineStyle: LineStyle(
                    lineLength: 70,
                    lineSpace: 0,
                    lineType: LineType.dotted,
                    defaultLineColor: MyColors.MainGrey.withOpacity(.4),
                    finishedLineColor: MyColors.SecondGreenColor),
                activeStep: controller.currentStep.value,
                stepBorderRadius: 1.5,
                activeStepTextColor: Colors.black87,
                finishedStepTextColor: Colors.black87,
                internalPadding: 0,
                showLoadingAnimation: false,
                stepRadius: 10,
                showStepBorder: false,
                steps: [
                  EasyStep(
                      customStep: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: controller.currentStep.value == 0
                              ? MyColors.SecondGreenColor
                              : controller.currentStep.value > 0
                                  ? MyColors.MainGreenColor
                                  : Colors.grey,
                        ),
                      ),
                      customTitle: Text(
                        AppLocalizations.of(context)!.client_details,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: controller.currentStep.value == 0
                              ? MyColors.SecondGreenColor
                              : controller.currentStep.value > 0
                                  ? MyColors.MainGreenColor
                                  : Colors.grey,
                        ),
                      )),
                  EasyStep(
                      customStep: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: controller.currentStep.value == 1
                              ? MyColors.SecondGreenColor
                              : controller.currentStep.value > 1
                                  ? MyColors.MainGreenColor
                                  : Colors.grey,
                        ),
                      ),
                      topTitle: true,
                      customTitle: Text(
                        AppLocalizations.of(context)!.verification,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: controller.currentStep.value == 1
                                ? MyColors.SecondGreenColor
                                : controller.currentStep.value > 1
                                    ? MyColors.MainGreenColor
                                    : Colors.grey),
                      )),
                  EasyStep(
                      customStep: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: controller.currentStep.value == 2
                              ? MyColors.SecondGreenColor
                              : controller.currentStep.value > 2
                                  ? MyColors.MainGreenColor
                                  : Colors.grey,
                        ),
                      ),
                      customTitle: Text(
                        AppLocalizations.of(context)!.fill_details,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: controller.currentStep.value == 2
                                ? MyColors.SecondGreenColor
                                : controller.currentStep.value > 2
                                    ? MyColors.MainGreenColor
                                    : Colors.grey),
                      )),
                  EasyStep(
                      customStep: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: controller.currentStep.value == 3
                              ? MyColors.SecondGreenColor
                              : controller.currentStep.value > 3
                                  ? MyColors.MainGreenColor
                                  : Colors.grey,
                        ),
                      ),
                      customTitle: Text(
                        AppLocalizations.of(context)!.finalized,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: controller.currentStep.value == 3
                                ? MyColors.SecondGreenColor
                                : controller.currentStep.value > 3
                                    ? MyColors.MainGreenColor
                                    : Colors.grey),
                      )),
                ],
                onStepReached: (index) => controller.currentStep.value = index,
              );
            }),
            Obx(() => _buildContentBasedOnStatus(controller.currentStep.value))
          ],
        ),
      ),
    ])));
  }
}
