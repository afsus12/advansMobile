import 'package:advans_app/Data/Controllers/StaffSignUpController.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/big_text.dart';
import 'package:advans_app/Widgets/buttonwithicon.dart';
import 'package:advans_app/Widgets/inputfield.dart';
import 'package:advans_app/commons/customShapes/Curvededge.dart';
import 'package:advans_app/commons/customShapes/Tcontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class StaffRegistrationScreen extends GetView<StaffSignUpController> {
  const StaffRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setContext(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CurvedEdge(),
              child: Container(
                color: MyColors.MainGreenColor,
                padding: EdgeInsets.all(0),
                child: SizedBox(
                  height: 300,
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
                      top: 120,
                      left: -140,
                      child: Tcontainer(
                        width: 390,
                        height: 130,
                        raduis: 80,
                        backgroundcolor: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 140.h,
                      left: 15.w,
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
            IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 20, right: 20, bottom: 10),
                child: Form(
                  key: controller.SignUpKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: AppLocalizations.of(context)!.staffRegister,
                        color: MyColors.MainGrey,
                        size: 26,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        child: Myinput(
                            controller: controller.usernameController,
                            validate: (p0) => controller.validateUsername(p0!),
                            icon: Icons.person,
                            height: 10,
                            labelText: AppLocalizations.of(context)!
                                .placeholderUsername),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Myinput(
                          icon: Icons.mail,
                          height: 10,
                          controller: controller.emailController,
                          validate: (p) => controller.validateEmail(p!),
                          labelText: AppLocalizations.of(context)!.email),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.width.w * 0.34.w,
                              child: Obx(() => Myinput(
                                  height: 10,
                                  controller: controller.passwordController,
                                  icon: Icons.lock,
                                  obscureText: controller.passwtogg2.value,
                                  validate: (p) =>
                                      controller.validatePasword(p!),
                                  Suffixicon: Icons.visibility,
                                  Suffixiconoff: Icons.visibility_off,
                                  suffixiconfun: () {
                                    controller.passwtogg2.value =
                                        !controller.passwtogg2.value;
                                  },
                                  labelText: AppLocalizations.of(context)!
                                      .clientPasswordPlaceholder))),
                          Spacer(),
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.width.w * 0.34.w,
                              child: Obx(() => Myinput(
                                  height: 10,
                                  controller: controller.passwordConController,
                                  icon: Icons.lock,
                                  obscureText: controller.passwtogg1.value,
                                  validate: (p) =>
                                      controller.validateConPassword(
                                          controller.passwordController.text,
                                          controller
                                              .passwordConController.text),
                                  Suffixicon: Icons.visibility,
                                  Suffixiconoff: Icons.visibility_off,
                                  suffixiconfun: () {
                                    controller.passwtogg1.value =
                                        !controller.passwtogg1.value;
                                  },
                                  labelText: AppLocalizations.of(context)!
                                      .confirmPasswordPlaceholder))),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.width.w * 0.34.w,
                              child: Myinput(
                                  height: 10,
                                  validate: (p0) =>
                                      controller.validatePrenom(p0!),
                                  icon: Icons.person,
                                  controller: controller.prenomController,
                                  labelText: AppLocalizations.of(context)!
                                      .firstNamePlaceholder)),
                          Spacer(),
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.width.w * 0.34.w,
                              child: Myinput(
                                  height: 10,
                                  icon: Icons.family_restroom,
                                  validate: (p0) => controller.validateNom(p0!),
                                  controller: controller.nomController,
                                  labelText: AppLocalizations.of(context)!
                                      .lastNamePlaceholder)),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.width.w * 0.34.w,
                              child: Myinput(
                                  height: 10,
                                  icon: Icons.credit_card,
                                  controller: controller.cinController,
                                  validate: (p0) => controller.validateCin(p0!),
                                  labelText:
                                      AppLocalizations.of(context)!.cin)),
                          Spacer(),
                          SizedBox(
                              width:
                                  MediaQuery.of(context).size.width.w * 0.34.w,
                              child: Myinput(
                                  height: 10,
                                  controller: controller.phoneController,
                                  icon: Icons.phone,
                                  validate: (v) => controller.validatePhone(v!),
                                  labelText: AppLocalizations.of(context)!
                                      .phoneNumber1Placeholder)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(() => controller.loading == false
                          ? ButtonWithIcon(
                              onPressed: () {
                                bool valid = controller.SignUpKey.currentState!
                                    .validate();
                                if (valid) {
                                  controller.Signup(
                                      controller.usernameController.text,
                                      controller.passwordController.text,
                                      controller.cinController.text,
                                      controller.emailController.text,
                                      controller.prenomController.text,
                                      controller.nomController.text,
                                      controller.phoneController.text);
                                }
                              },
                              text: AppLocalizations.of(context)!.registration,
                              fontSize: 24,
                              mainColor: MyColors.MainGreenColor,
                              textcolor: Colors.white,
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                  backgroundColor: MyColors.SecondGreenColor),
                            )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
