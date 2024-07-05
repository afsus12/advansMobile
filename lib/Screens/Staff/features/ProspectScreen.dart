import 'package:advans_app/Data/Controllers/StaffProspectController.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/CustomAppBar.dart';
import 'package:advans_app/Widgets/OtpWidget.dart';
import 'package:advans_app/Widgets/big_text.dart';
import 'package:advans_app/Widgets/buttonwithicon.dart';
import 'package:advans_app/Widgets/dropdown.dart';
import 'package:advans_app/Widgets/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProspectScreen extends GetView<StaffProspectController> {
  const ProspectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.setContext(context);
    return Scaffold(
      body: ListView(
        children: [
          Appbar(
            name: "",
            appheight: 80,
            title: AppLocalizations.of(context)!.createProspect,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              top: 20.h,
              right: 20.h,
            ),
            child: Form(
              key: controller.prospectKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: BigText(
                      text: AppLocalizations.of(context)!.fill_the_form,
                      color: Colors.black,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width.w * 0.35,
                          child: Myinput(
                              icon: Icons.person,
                              height: 10,
                              validate: (v) => controller.validateThese(v!),
                              controller: controller.fnameController,
                              labelText: AppLocalizations.of(context)!
                                  .firstNamePlaceholder)),
                      Spacer(),
                      SizedBox(
                          width: MediaQuery.of(context).size.width.w * 0.35,
                          child: Myinput(
                              validate: (v) => controller.validateThese(v!),
                              icon: Icons.family_restroom,
                              height: 10,
                              controller: controller.lnameController,
                              labelText: AppLocalizations.of(context)!
                                  .lastNamePlaceholder)),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width.w * 0.6,
                      child: Myinput(
                          icon: Icons.mail,
                          fontsize: 12,
                          height: 10,
                          validate: (v) => controller.validateThese(v!),
                          controller: controller.emailController,
                          labelText: AppLocalizations.of(context)!.email)),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    width: ScreenUtil.defaultSize.width * 0.90,
                    child: MyDropDown(
                      project: [
                        "Main Street Branch",
                        "Downtown Branch",
                        "West End Branch",
                        "East Side Branch",
                        "Central Branch"
                      ],
                      icon: Icons.warehouse,
                      labelText: AppLocalizations.of(context)!.branch,
                      fontsize: 14,
                      controller: controller.branchController,
                      suffixIcon: Icons.arrow_drop_down,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    child: SizedBox(
                      width: ScreenUtil.defaultSize.width * 0.90,
                      child: MyDropDown(
                        project: [
                          "Home Construction",
                          "Small Business Owner",
                          "Student",
                          "Professional Services",
                          "Retail"
                        ],
                        icon: Icons.local_activity,
                        labelText:
                            AppLocalizations.of(context)!.field_of_activity,
                        fontsize: 14,
                        controller: controller.AcitvityController,
                        suffixIcon: Icons.arrow_drop_down,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    child: SizedBox(
                      width: ScreenUtil.defaultSize.width * 0.90,
                      child: MyDropDown(
                        validate: (v) => controller.validateThese(v!),
                        project: [
                          "Contractor",
                          "Entrepreneur",
                          "Student",
                          "Consultant",
                          "Retail Sales Associate"
                        ],
                        icon: Icons.work,
                        labelText: AppLocalizations.of(context)!.job_of_holder,
                        fontsize: 14,
                        controller: controller.jobController,
                        suffixIcon: Icons.arrow_drop_down,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width.w * 0.35,
                          child: Myinput(
                            validate: (v) => controller.validateThese(v!),
                            labelText: AppLocalizations.of(context)!.address,
                            controller: controller.addressController,
                            icon: Icons.home,
                            height: 10,
                          )),
                      Spacer(),
                      SizedBox(
                          width: MediaQuery.of(context).size.width.w * 0.35,
                          child: Myinput(
                              icon: Icons.credit_card,
                              fontsize: 12,
                              height: 10,
                              validate: (v) => controller.validateThese(v!),
                              controller: controller.cinController,
                              labelText: AppLocalizations.of(context)!.cin)),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width.w * 0.35,
                          child: Myinput(
                            validate: (v) => controller.validateThese(v!),
                            labelText:
                                AppLocalizations.of(context)!.postal_code,
                            keyboardType: TextInputType.number,
                            controller: controller.postController,
                            icon: Icons.code,
                          )),
                      Spacer(),
                      SizedBox(
                          width: MediaQuery.of(context).size.width.w * 0.35,
                          child: Myinput(
                            validate: (v) => controller.validateThese(v!),
                            labelText: AppLocalizations.of(context)!.town,
                            icon: Icons.home_work,
                            controller: controller.townController,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width.w * 0.35,
                          child: Myinput(
                            validate: (v) => controller.validateThese(v!),
                            labelText: AppLocalizations.of(context)!.country,
                            icon: Icons.flag,
                            height: 10,
                            controller: controller.countryController,
                          )),
                      Spacer(),
                      SizedBox(
                          width: MediaQuery.of(context).size.width.w * 0.35,
                          child: Myinput(
                            validate: (v) => controller.validateThese(v!),
                            labelText: AppLocalizations.of(context)!.phone,
                            icon: Icons.phone,
                            keyboardType: TextInputType.phone,
                            height: 10,
                            controller: controller.phoneController,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalizations.of(context)!.gender,
                            style: TextStyle(
                                fontSize: 17, fontFamily: "Roboto-Regular")),
                        SizedBox(
                          height: ScreenUtil.defaultSize.height * 0.065,
                          child: Obx(() => ToggleButtons(
                                borderRadius: BorderRadius.circular(14),
                                isSelected: controller.isSelected2,
                                selectedColor: Colors.white,
                                color: Colors.black,
                                fillColor: MyColors.SecondGreenColor,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    child: Center(
                                      child: Text(
                                          AppLocalizations.of(context)!.male,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Roboto-Regular")),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    child: Center(
                                      child: Text(
                                          AppLocalizations.of(context)!.female,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Roboto-Regular")),
                                    ),
                                  ),
                                ],
                                onPressed: (int index) {
                                  controller.isSelected2[index] = true;
                                  if (index == 0) {
                                    controller.gender.value.text = "Male";
                                    controller.isSelected2[1] = false;
                                  } else {
                                    controller.gender.value.text = "Female";
                                    controller.isSelected2[0] = false;
                                  }
                                },
                              )),
                        )
                      ]),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(() => controller.loading == false
                      ? SizedBox(
                          height: 50,
                          child: ButtonWithIcon(
                            text: AppLocalizations.of(context)!.add_prospect,
                            onPressed: () {
                              bool valid = controller.prospectKey.currentState!
                                  .validate();
                              if (valid) {
                                controller.addProspect(
                                    controller.fnameController.value.text,
                                    controller.lnameController.value.text,
                                    controller.addressController.value.text,
                                    controller.gender.value.text == "Male"
                                        ? "M"
                                        : "F",
                                    "gggg",
                                    controller.userCode.value,
                                    controller.phoneController.value.text,
                                    controller.emailController.value.text,
                                    controller.branchController.value.text,
                                    "02",
                                    controller.AcitvityController.value.text,
                                    controller.jobController.value.text,
                                    controller.cinController.value.text);
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
                  /*     Row(
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
                  ), */
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
