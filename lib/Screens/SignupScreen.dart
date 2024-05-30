import 'package:advans_app/Utils/myColors.dart';
import 'package:advans_app/Widgets/big_text.dart';
import 'package:advans_app/Widgets/inputfield.dart';
import 'package:advans_app/commons/customShapes/Curvededge.dart';
import 'package:advans_app/commons/customShapes/Tcontainer.dart';
import 'package:advans_app/controllers/StepperController.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:slide_countdown/slide_countdown.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final StepperController controller = Get.put(StepperController());
    List<Step> _getSteps() {
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
    }

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
            height: 400,
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
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: BigText(
          text: "Sign up",
          color: Colors.black,
          size: 25,
        ),
      ),
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
                  "Details du client",
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
                        : controller.currentStep.value > 0
                            ? MyColors.MainGreenColor
                            : Colors.grey,
                  ),
                ),
                topTitle: true,
                customTitle: Text(
                  "Verification",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: controller.currentStep.value == 1
                          ? MyColors.SecondGreenColor
                          : controller.currentStep.value > 0
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
                        : controller.currentStep.value > 0
                            ? MyColors.MainGreenColor
                            : Colors.grey,
                  ),
                ),
                customTitle: Text(
                  "Remplir Details",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: controller.currentStep.value == 2
                          ? MyColors.SecondGreenColor
                          : controller.currentStep.value > 0
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
                        : controller.currentStep.value > 0
                            ? MyColors.MainGreenColor
                            : Colors.grey,
                  ),
                ),
                customTitle: Text(
                  "Finalisé",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: controller.currentStep.value == 3
                          ? MyColors.SecondGreenColor
                          : controller.currentStep.value > 0
                              ? MyColors.MainGreenColor
                              : Colors.grey),
                )),
          ],
          onStepReached: (index) => controller.currentStep.value = index,
        );
      }),
      Myinput(labelText: "Numero Client"),
      SizedBox(
        height: 15,
      ),
      Myinput(labelText: "Date naissance")
    ])));
  }
}
