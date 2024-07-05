import 'package:advans_app/Data/Controllers/Language_Controller.dart';
import 'package:advans_app/Screens/Client/authentification/ClientAuth.dart';
import 'package:advans_app/Screens/Client/authentification/LoginScreen.dart';
import 'package:advans_app/Screens/Client/authentification/SignupScreen.dart';
import 'package:advans_app/Screens/Staff/authentification/StaffAuth.dart';
import 'package:advans_app/Screens/Staff/authentification/StaffLogin.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/big_text.dart';
import 'package:advans_app/Widgets/buttonwithicon.dart';

import 'package:advans_app/commons/customShapes/Tcontainer.dart';
import 'package:advans_app/routes/routes_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LocaleController appController = Get.find<LocaleController>();

    return Material(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  decoration: BoxDecoration(color: Colors.white),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                      color: MyColors.MainGreenColor,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(70))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                        child: SvgPicture.asset(
                          "assets/images/svglogo.svg",
                          width: 200,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        AppLocalizations.of(context)!.appname,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 2,
                            letterSpacing: 2),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          AppLocalizations.of(context)!.appslogan,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white60,
                              fontSize: 17,
                              wordSpacing: 1,
                              letterSpacing: 2),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.666,
                    decoration: BoxDecoration(
                      color: MyColors.MainGreenColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.666,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(70))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Material(
                          color: MyColors.MainGreenColor,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(routesGuide.authScreenStaff);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.62.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.work,
                                    size: 25.sp,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.staffMember,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(routesGuide.authScreenClient);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.62.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: MyColors.MainGreenColor, // Border color
                                width: 1, // Border width
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 25.sp,
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  AppLocalizations.of(context)!.clientMember,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                            height: 80.h,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Obx(() {
                                    String imagePath;
                                    if (appController.currentLanguage.value ==
                                        'en') {
                                      imagePath =
                                          'assets/images/united-kingdom.png'; // Replace with your image path
                                    } else if (appController
                                            .currentLanguage.value ==
                                        'fr') {
                                      imagePath =
                                          'assets/images/france.png'; // Replace with your image path
                                    } else {
                                      imagePath =
                                          'assets/images/tunisia.png'; // Replace with your image path
                                    }
                                    return CircleAvatar(
                                      foregroundImage: AssetImage(imagePath),
                                      radius: 20.sp,
                                      backgroundColor: Colors.transparent,
                                    );
                                  }),
                                  Expanded(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.change_circle_rounded,
                                        color: MyColors.SecondGreenColor,
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        appController.switchLanguage();
                                      },
                                    ),
                                  ),
                                ]))
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
