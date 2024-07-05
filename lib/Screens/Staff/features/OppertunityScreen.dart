import 'package:advans_app/Data/Controllers/StaffOpertunityController.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/CustomAppBar.dart';
import 'package:advans_app/Widgets/big_text.dart';
import 'package:advans_app/Widgets/buttonwithicon.dart';
import 'package:advans_app/Widgets/drawerStaff.dart';
import 'package:advans_app/Widgets/dropdown.dart';
import 'package:advans_app/Widgets/inputfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class OpertunityScreen extends GetView<StaffOpertunityController> {
  OpertunityScreen({super.key});
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    controller.setContext(context);
    return AdvancedDrawer(
      drawer: SideMenuStaff(),
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
        body: ListView(children: [
          Appbar(
            name: "",
            appheight: 80,
            title: AppLocalizations.of(context)!.createOpportunity,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              top: 20.h,
              right: 20.h,
            ),
            child: Form(
                key: controller.operKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Obx(() => BigText(
                            text: controller.show.value == true
                                ? AppLocalizations.of(context)!
                                    .fill_opportunity_details
                                : AppLocalizations.of(context)!.fill_the_form,
                            color: Colors.black,
                            textAlign: TextAlign.left,
                          )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Obx(() => controller.show.value == true
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width.w *
                                      0.35,
                                  child: Myinput(
                                      icon: Icons.person,
                                      height: 10,
                                      enabled: false,
                                      textColor: Colors.black,
                                      labelText:
                                          controller.prospect.value.firstname)),
                              Spacer(),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width.w *
                                      0.35,
                                  child: Myinput(
                                      icon: Icons.family_restroom,
                                      height: 10,
                                      enabled: false,
                                      textColor: Colors.black,
                                      labelText:
                                          controller.prospect.value.lastname)),
                            ],
                          )
                        : SizedBox.shrink()),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() => controller.show.value == true
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width.w * 0.35,
                            child: Myinput(
                                icon: Icons.security,
                                height: 10,
                                enabled: false,
                                textColor: Colors.black,
                                labelText: controller.prospect.value.customer!))
                        : SizedBox.shrink()),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(() => GestureDetector(
                          onTap: () async {
                            DateTime? pickdate = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1990),
                                initialDate: DateTime.now(),
                                lastDate: DateTime(2050));
                            print(pickdate);
                            controller.dateController.value.text =
                                DateFormat("yyyy-MM-dd").format(pickdate!);
                          },
                          child: SizedBox(
                            width: ScreenUtil.defaultSize.width * 0.9,
                            child: Myinput(
                              aligncenter: true,
                              enabled: false,
                              controller: controller.dateController.value,
                              labelText: AppLocalizations.of(context)!
                                  .projectDatePlaceholder,
                              validate: (p) => controller.validateThese(p!),
                              icon: Icons.calendar_month,
                              keyboardType: TextInputType.datetime,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: ScreenUtil.defaultSize.width * 0.90,
                      child: MyDropDown(
                        errorText:
                            AppLocalizations.of(context)!.mandatory_field,
                        project: [
                          "Business Loan",
                          "Education Loan",
                          "Personal Loan"
                        ],
                        validate: (p) {
                          if (controller.subjectController.value.text == "" ||
                              controller.subjectController.value.text == null) {
                            return AppLocalizations.of(context)!
                                .mandatory_field;
                          }
                        },
                        icon: Icons.warehouse,
                        labelText: AppLocalizations.of(context)!.subject,
                        fontsize: 14,
                        controller: controller.subjectController,
                        suffixIcon: Icons.arrow_drop_down,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: ScreenUtil.defaultSize.width * 0.90,
                      child: MyDropDown(
                        project: [
                          "Business Expansion",
                          "University Fees",
                          "Medical Expenses"
                        ],
                        icon: Icons.warehouse,
                        labelText: AppLocalizations.of(context)!
                            .designationPlaceholder,
                        fontsize: 14,
                        controller: controller.designationController,
                        suffixIcon: Icons.arrow_drop_down,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Obx(() => controller.loading == false
                        ? SizedBox(
                            height: 50,
                            child: ButtonWithIcon(
                              text:
                                  AppLocalizations.of(context)!.add_opportunity,
                              onPressed: () {
                                bool valid =
                                    controller.operKey.currentState!.validate();
                                if (controller
                                            .designationController.value.text !=
                                        "" &&
                                    controller.subjectController.value.text !=
                                        "") {
                                  if (valid) {
                                    controller.addOpertunity(
                                        controller.prospect.value.customer!,
                                        controller.subjectController.value.text,
                                        "",
                                        controller
                                            .designationController.value.text,
                                        controller.dateController.value.text);
                                  }
                                } else {
                                  Get.snackbar(
                                      AppLocalizations.of(context)!.error,
                                      AppLocalizations.of(context)!
                                          .pick_designation_subject,
                                      snackPosition: SnackPosition.BOTTOM);
                                }
                              },
                              mainColor: MyColors.MainGreenColor,
                              textcolor: Colors.white,
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(
                                backgroundColor: MyColors.SecondGreenColor),
                          ))
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
