import 'package:advans_app/Data/Controllers/StaffSignInController.dart';
import 'package:advans_app/Screens/Staff/home/StaffHomeScreen.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/big_text.dart';
import 'package:advans_app/Widgets/buttonwithicon.dart';
import 'package:advans_app/Widgets/inputfield.dart';
import 'package:advans_app/bloc/login/login_bloc.dart';
import 'package:advans_app/bloc/login/login_event.dart';
import 'package:advans_app/bloc/login/login_state.dart';
import 'package:advans_app/commons/customShapes/Curvededge.dart';
import 'package:advans_app/commons/customShapes/Tcontainer.dart';
import 'package:advans_app/routes/routes_guide.dart';
import 'package:advans_app/services/authentification/authentificationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class StaffLoginScreen extends GetView<StaffSignInController> {
  const StaffLoginScreen({super.key});

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
                  height: 450,
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
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: controller.SignInKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: AppLocalizations.of(context)!.staffLogin,
                      color: MyColors.MainGrey,
                      size: 26,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Myinput(
                        icon: Icons.person,
                        controller: controller.usernameController,
                        validate: (v) => controller.validateUsername(v!),
                        labelText:
                            AppLocalizations.of(context)!.placeholderUsername),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() => Myinput(
                        icon: Icons.lock,
                        Suffixicon: Icons.visibility,
                        obscureText: controller.passwtogg2.value,
                        Suffixiconoff: Icons.visibility_off,
                        validate: (v) => controller.validatePasword(v!),
                        suffixiconfun: () {
                          controller.passwtogg2.value =
                              !controller.passwtogg2.value;
                        },
                        controller: controller.passwordController,
                        labelText:
                            AppLocalizations.of(context)!.placeholderPassword)),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() => controller.loading == false
                        ? ButtonWithIcon(
                            onPressed: () {
                              bool valid =
                                  controller.SignInKey.currentState!.validate();
                              if (valid) {
                                controller.login(
                                    controller.usernameController.value.text,
                                    controller.passwordController.value.text);
                              }
                            },
                            text: AppLocalizations.of(context)!.textLoginButton,
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
            )
          ],
        ),
      ),
    );
  }
}
