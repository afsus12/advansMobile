import 'package:advans_app/Screens/Staff/authentification/StaffLogin.dart';
import 'package:advans_app/Screens/Staff/authentification/StaffRegistration.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/routes/routes_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class StaffAuthScreen extends StatelessWidget {
  const StaffAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
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
                                Get.toNamed(routesGuide.signInStaff);
                              },
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.6.w,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 60, vertical: 10),
                                child: Text(
                                  AppLocalizations.of(context)!.staffLogin,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(routesGuide.signUpStaff);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                textAlign: TextAlign.center,
                                AppLocalizations.of(context)!.staffRegister,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )))
            ])));
  }
}
