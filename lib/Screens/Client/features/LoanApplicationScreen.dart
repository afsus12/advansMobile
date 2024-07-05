import 'dart:io';

import 'package:advans_app/Data/Controllers/ClientLoanApplicationController.dart';
import 'package:advans_app/Models/CategoryModel.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/CategoryDetails.dart';
import 'package:advans_app/Widgets/CustomAppBar.dart';
import 'package:advans_app/Widgets/LoanCategorieWidget.dart';
import 'package:advans_app/Widgets/big_text.dart';
import 'package:advans_app/Widgets/buttonwithicon.dart';
import 'package:advans_app/Widgets/drawer.dart';
import 'package:advans_app/Widgets/dropdown.dart';
import 'package:advans_app/Widgets/inputfield.dart';
import 'package:advans_app/routes/routes_guide.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:email_validator/email_validator.dart';

class LoanAppScreen extends GetView<ClientLonaApplicationController> {
  LoanAppScreen({super.key});
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    controller.setContext(context);
    final List<String> produitList = [
      AppLocalizations.of(context)!.category1_title,
      AppLocalizations.of(context)!.category2_title,
      AppLocalizations.of(context)!.category3_title,
      AppLocalizations.of(context)!.category4_title,
      AppLocalizations.of(context)!.category5_title
    ];
    List<String> images = [
      "assets/images/tatwir.svg",
      "assets/images/investissement.svg",
      "assets/images/agricole.svg",
      "assets/images/scholar.svg",
      "assets/images/logement.svg"
    ];
    final governorates = [
      AppLocalizations.of(context)!.ariana,
      AppLocalizations.of(context)!.beja,
      AppLocalizations.of(context)!.ben_arous,
      AppLocalizations.of(context)!.bizerte,
      AppLocalizations.of(context)!.gabes,
      AppLocalizations.of(context)!.gafsa,
      AppLocalizations.of(context)!.jendouba,
      AppLocalizations.of(context)!.kairouan,
      AppLocalizations.of(context)!.kebili,
      AppLocalizations.of(context)!.kef,
      AppLocalizations.of(context)!.mahdia,
      AppLocalizations.of(context)!.manouba,
      AppLocalizations.of(context)!.medenine,
      AppLocalizations.of(context)!.monastir,
      AppLocalizations.of(context)!.nabeul,
      AppLocalizations.of(context)!.sfax,
      AppLocalizations.of(context)!.sidi_bouzid,
      AppLocalizations.of(context)!.siliana,
      AppLocalizations.of(context)!.sousse,
      AppLocalizations.of(context)!.tataouine,
      AppLocalizations.of(context)!.tozeur,
      AppLocalizations.of(context)!.tunis,
      AppLocalizations.of(context)!.zaghouan,
    ];

    List<Category> catList = [
      Category(
          title: AppLocalizations.of(context)!.category1_title,
          description1: AppLocalizations.of(context)!.category1_description1,
          description2: AppLocalizations.of(context)!.category1_description2,
          detailScreenTitle:
              AppLocalizations.of(context)!.category1_detailScreen_title,
          detailScreenDetails:
              AppLocalizations.of(context)!.category1_detailScreen_details,
          detailedDescription: AppLocalizations.of(context)!
              .category1_detailScreen_detailedDescription,
          eligibilityTitle: AppLocalizations.of(context)!
              .category1_detailScreen_eligibility_title,
          eligibilityCriteria: [
            AppLocalizations.of(context)!
                .category1_detailScreen_eligibility_criteria1,
            AppLocalizations.of(context)!
                .category1_detailScreen_eligibility_criteria2,
            AppLocalizations.of(context)!
                .category1_detailScreen_eligibility_criteria3,
          ],
          conditionsTitle: AppLocalizations.of(context)!
              .category1_detailScreen_conditions_title,
          conditions: [
            AppLocalizations.of(context)!
                .category1_detailScreen_conditions_condition1,
            AppLocalizations.of(context)!
                .category1_detailScreen_conditions_condition2,
            AppLocalizations.of(context)!
                .category1_detailScreen_conditions_condition3,
            AppLocalizations.of(context)!
                .category1_detailScreen_conditions_condition4
          ]),
      Category(
        title: AppLocalizations.of(context)!.category2_title,
        description1: AppLocalizations.of(context)!.category2_description1,
        description2: AppLocalizations.of(context)!.category2_description2,
        detailScreenTitle:
            AppLocalizations.of(context)!.category2_detailScreen_title,
        detailScreenDetails:
            AppLocalizations.of(context)!.category2_detailScreen_details,
        detailedDescription: AppLocalizations.of(context)!
            .category2_detailScreen_detailedDescription,
        eligibilityTitle: AppLocalizations.of(context)!
            .category2_detailScreen_eligibility_title,
        eligibilityCriteria: [
          AppLocalizations.of(context)!
              .category2_detailScreen_eligibility_criteria1,
          AppLocalizations.of(context)!
              .category2_detailScreen_eligibility_criteria2,
          AppLocalizations.of(context)!
              .category2_detailScreen_eligibility_criteria3,
          AppLocalizations.of(context)!
              .category2_detailScreen_eligibility_criteria4,
        ],
        conditionsTitle: AppLocalizations.of(context)!
            .category2_detailScreen_conditions_title,
        conditions: [
          AppLocalizations.of(context)!
              .category2_detailScreen_conditions_condition1,
          AppLocalizations.of(context)!
              .category2_detailScreen_conditions_condition2,
          AppLocalizations.of(context)!
              .category2_detailScreen_conditions_condition3,
          AppLocalizations.of(context)!
              .category2_detailScreen_conditions_condition4,
        ],
      ),
      Category(
        title: AppLocalizations.of(context)!.category3_title,
        description1: AppLocalizations.of(context)!.category3_description1,
        description2: AppLocalizations.of(context)!.category3_description2,
        detailScreenTitle:
            AppLocalizations.of(context)!.category3_detailScreen_title,
        detailScreenDetails:
            AppLocalizations.of(context)!.category3_detailScreen_details,
        detailedDescription: AppLocalizations.of(context)!
            .category3_detailScreen_detailedDescription,
        eligibilityTitle: AppLocalizations.of(context)!
            .category3_detailScreen_eligibility_title,
        eligibilityCriteria: [
          AppLocalizations.of(context)!
              .category3_detailScreen_eligibility_criteria1,
          AppLocalizations.of(context)!
              .category3_detailScreen_eligibility_criteria2,
          AppLocalizations.of(context)!
              .category3_detailScreen_eligibility_criteria3,
          AppLocalizations.of(context)!
              .category3_detailScreen_eligibility_criteria4,
        ],
        conditionsTitle: AppLocalizations.of(context)!
            .category3_detailScreen_conditions_title,
        conditions: [
          AppLocalizations.of(context)!
              .category3_detailScreen_conditions_condition1,
          AppLocalizations.of(context)!
              .category3_detailScreen_conditions_condition2,
        ],
      ),
      Category(
        title: AppLocalizations.of(context)!.category4_title,
        description1: AppLocalizations.of(context)!.category4_description1,
        description2: AppLocalizations.of(context)!.category4_description2,
        detailScreenTitle:
            AppLocalizations.of(context)!.category4_detailScreen_title,
        detailScreenDetails:
            AppLocalizations.of(context)!.category4_detailScreen_details,
        detailedDescription: AppLocalizations.of(context)!
            .category4_detailScreen_detailedDescription,
        eligibilityTitle: AppLocalizations.of(context)!
            .category4_detailScreen_eligibility_title,
        eligibilityCriteria: [
          AppLocalizations.of(context)!
              .category4_detailScreen_eligibility_criteria1,
          AppLocalizations.of(context)!
              .category4_detailScreen_eligibility_criteria2,
          AppLocalizations.of(context)!
              .category4_detailScreen_eligibility_criteria3,
          AppLocalizations.of(context)!
              .category4_detailScreen_eligibility_criteria4,
        ],
        conditionsTitle: AppLocalizations.of(context)!
            .category4_detailScreen_conditions_title,
        conditions: [
          AppLocalizations.of(context)!
              .category4_detailScreen_conditions_condition1,
          AppLocalizations.of(context)!
              .category4_detailScreen_conditions_condition2,
          AppLocalizations.of(context)!
              .category4_detailScreen_conditions_condition3,
          AppLocalizations.of(context)!
              .category4_detailScreen_conditions_condition4,
        ],
        subscriptionSteps: [
          AppLocalizations.of(context)!
              .category4_detailScreen_subscription_step1,
          AppLocalizations.of(context)!
              .category4_detailScreen_subscription_step2,
          AppLocalizations.of(context)!
              .category4_detailScreen_subscription_step3,
        ],
      ),
      Category(
        title: AppLocalizations.of(context)!.category5_title,
        description1: AppLocalizations.of(context)!.category5_description1,
        description2: AppLocalizations.of(context)!.category5_description2,
        detailScreenTitle:
            AppLocalizations.of(context)!.category5_detailScreen_title,
        detailScreenDetails:
            AppLocalizations.of(context)!.category5_detailScreen_details,
        detailedDescription: AppLocalizations.of(context)!
            .category5_detailScreen_detailedDescription,
        eligibilityTitle: AppLocalizations.of(context)!
            .category5_detailScreen_eligibility_title,
        eligibilityCriteria: [
          AppLocalizations.of(context)!
              .category5_detailScreen_eligibility_criteria1,
          AppLocalizations.of(context)!
              .category5_detailScreen_eligibility_criteria2,
          AppLocalizations.of(context)!
              .category5_detailScreen_eligibility_criteria3,
          AppLocalizations.of(context)!
              .category5_detailScreen_eligibility_criteria4,
        ],
        conditionsTitle: AppLocalizations.of(context)!
            .category5_detailScreen_conditions_title,
        conditions: [
          AppLocalizations.of(context)!
              .category5_detailScreen_conditions_condition1,
          AppLocalizations.of(context)!
              .category5_detailScreen_conditions_condition2,
          AppLocalizations.of(context)!
              .category5_detailScreen_conditions_condition3,
          AppLocalizations.of(context)!
              .category5_detailScreen_conditions_condition4,
        ],
        subscriptionSteps: [
          AppLocalizations.of(context)!
              .category5_detailScreen_subscription_step1,
          AppLocalizations.of(context)!
              .category5_detailScreen_subscription_step2,
          AppLocalizations.of(context)!
              .category5_detailScreen_subscription_step3,
          AppLocalizations.of(context)!
              .category5_detailScreen_subscription_step4,
        ],
      )
    ];

    Widget _buildContentBasedOnStatus(int status) {
      switch (status) {
        case 0:
          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text.rich(
                  TextSpan(text: '', children: <InlineSpan>[
                    TextSpan(
                        text:
                            AppLocalizations.of(context)!.client_information1),
                    TextSpan(
                        text: "  " +
                            controller.name.value +
                            '  ' +
                            controller.lname.value,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    TextSpan(
                        text:
                            AppLocalizations.of(context)!.client_information2),
                  ]),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ButtonWithIcon(
                      width: 150,
                      height: 40,
                      onPressed: () {
                        Get.offAllNamed(routesGuide.homeScreenClient);
                      },
                      text: AppLocalizations.of(context)!.refuse,
                      fontSize: 16,
                      mainColor: MyColors.MainRedBig,
                      textcolor: Colors.white,
                    ),
                    ButtonWithIcon(
                      width: 200,
                      height: 40,
                      onPressed: () {
                        controller.currentStep.value++;
                        String a = controller.setVariableList(
                            controller.currentCatIndex.value, produitList);
                        controller.AcitvityController.value.text = a;
                      },
                      text: AppLocalizations.of(context)!.accept,
                      fontSize: 16,
                      mainColor: MyColors.MainGreenColor,
                      textcolor: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          );
        case 1:
          return Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: controller.Step1Key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: BigText(
                      text: AppLocalizations.of(context)!.verify_details,
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
                          width: MediaQuery.of(context).size.width.w * 0.38,
                          child: Myinput(
                              icon: Icons.person,
                              height: 10,
                              width: 12,
                              validate: (v) => controller.validateThese(v!),
                              controller: controller.fullname.value,
                              labelText: AppLocalizations.of(context)!
                                  .firstNamePlaceholder)),
                      Spacer(),
                      SizedBox(
                          width: MediaQuery.of(context).size.width.w * 0.38,
                          child: Myinput(
                              validate: (v) => controller.validateThese(v!),
                              icon: Icons.credit_card_rounded,
                              width: 12,
                              height: 10,
                              controller: controller.cinEd.value,
                              labelText: AppLocalizations.of(context)!.cin)),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width.w * 0.6,
                      child: Myinput(
                          icon: Icons.mail,
                          width: 12,
                          height: 10,
                          validate: (v) {
                            if (!EmailValidator.validate(v!)) {
                              return "Email not Valid";
                            }
                          },
                          controller: controller.emailEd.value,
                          labelText: AppLocalizations.of(context)!.email)),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width.w * 0.4,
                          child: Myinput(
                            validate: (v) => controller.validateThese(v!),
                            labelText: AppLocalizations.of(context)!.phone,
                            controller: controller.phoneEd.value,
                            icon: Icons.phone,
                            maxlength: 8,
                            keyboardType: TextInputType.phone,
                            height: 10,
                          )),
                      Spacer(),
                      SizedBox(
                          width: MediaQuery.of(context).size.width.w * 0.35,
                          child: Myinput(
                            validate: (v) {
                              if (v == "" || v == null) {
                                return AppLocalizations.of(context)!
                                    .mandatory_field;
                              } else {
                                if (int.parse(v) < 18 || int.parse(v) >= 66) {
                                  return AppLocalizations.of(context)!
                                      .age_between;
                                }
                              }
                            },
                            labelText: AppLocalizations.of(context)!.age,
                            controller: controller.age,
                            icon: Icons.numbers_sharp,
                            maxlength: 2,
                            keyboardType: TextInputType.phone,
                            height: 10,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width.w * 0.6,
                      child: Myinput(
                          icon: Icons.flag,
                          width: 12,
                          height: 10,
                          validate: (v) => controller.validateThese(v!),
                          controller: controller.nationalite,
                          labelText:
                              AppLocalizations.of(context)!.nationality)),
                  SizedBox(
                    height: 8.h,
                  ),
                  Obx(() => controller.loading == false
                      ? SizedBox(
                          height: 50,
                          child: ButtonWithIcon(
                            text: AppLocalizations.of(context)!.next,
                            onPressed: () {
                              bool valid =
                                  controller.Step1Key.currentState!.validate();
                              if (valid) {
                                controller.currentStep.value++;
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
          );
        case 2:
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: controller.Step2Key,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.job_details,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width.w * 0.90.w,
                      child: Myinput(
                          height: 10,
                          controller: controller.actvityType,
                          icon: Icons.work,
                          validate: (v) => controller.validateThese(v!),
                          labelText: AppLocalizations.of(context)!.job)),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width.w * 0.33.w,
                          child: Myinput(
                              height: 10,
                              controller: controller.activityAdresse,
                              icon: Icons.home_work_sharp,
                              validate: (v) => controller.validateThese(v!),
                              labelText:
                                  AppLocalizations.of(context)!.job_address)),
                      Spacer(),
                      SizedBox(
                          width: MediaQuery.of(context).size.width.w * 0.33.w,
                          child: Myinput(
                              height: 10,
                              controller: controller.activityexperienceDuration,
                              icon: Icons.scoreboard_outlined,
                              keyboardType: TextInputType.number,
                              validate: (v) => controller.validateThese(v!),
                              labelText: AppLocalizations.of(context)!
                                  .job_experience_years)),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: ScreenUtil.defaultSize.width * 0.6.w,
                    child: MyDropDown(
                      project: governorates,
                      icon: Icons.local_atm,
                      labelText: AppLocalizations.of(context)!.governorat,
                      fontsize: 14,
                      controller: controller.governorat,
                      suffixIcon: Icons.arrow_drop_down,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.loan_details,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: ScreenUtil.defaultSize.width * 0.90.w,
                    child: MyDropDown(
                      project: produitList,
                      icon: Icons.local_atm,
                      labelText: AppLocalizations.of(context)!.product,
                      fontsize: 14,
                      controller: controller.AcitvityController.value,
                      suffixIcon: Icons.arrow_drop_down,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width.w * 0.5.w,
                      child: Myinput(
                          currency: "TND",
                          height: 10,
                          controller: controller.amount,
                          icon: Icons.money,
                          keyboardType: TextInputType.number,
                          validate: (v) => controller.validateThese(v!),
                          labelText: AppLocalizations.of(context)!.amount)),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width.w * 0.9.w,
                      child: Myinput(
                          height: 10,
                          controller: controller.loanpurpose,
                          icon: Icons.scoreboard_outlined,
                          validate: (v) => controller.validateThese(v!),
                          labelText:
                              AppLocalizations.of(context)!.loan_purpose)),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonWithIcon(
                    width: 350,
                    height: 45,
                    onPressed: () {
                      bool valid = controller.Step2Key.currentState!.validate();
                      if (valid) {
                        controller.currentStep.value++;
                      }
                    },
                    text: AppLocalizations.of(context)!.next,
                    fontSize: 20,
                    mainColor: MyColors.MainGreenColor,
                    textcolor: Colors.white,
                  )
                ],
              ),
            ),
          );
        case 3:
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.upload_proof_documents,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 10,
                ),
                catList[controller.currentCatIndex.value].subscriptionSteps !=
                        null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: catList[4]
                            .subscriptionSteps!
                            .map(
                              (criteria) => Text(
                                '- $criteria',
                                style: TextStyle(fontSize: 15),
                              ),
                            )
                            .toList(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: catList[controller.currentCatIndex.value]
                            .conditions!
                            .map(
                              (criteria) => Text(
                                '- $criteria',
                                style: TextStyle(fontSize: 15),
                              ),
                            )
                            .toList(),
                      ),
                SizedBox(
                  height: 25,
                ),
                Obx(() {
                  if (controller.pickedFiles.isEmpty) {
                    return Icon(
                      Icons.file_upload_sharp,
                      size: 50,
                      color: MyColors.MainGrey.withOpacity(0.3),
                    );
                  }
                  return Container(
                      height: 100, // Set a fixed height for the ListView
                      child: ListView.builder(
                        itemCount: controller.pickedFiles.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons
                                      .insert_drive_file, // Use your desired icon here
                                  size: 50,
                                ),
                                SizedBox(height: 8),
                                Container(
                                  width:
                                      80, // Limit the width to avoid overflow
                                  child: Text(
                                    controller.pickedFiles[index].name,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ));
                }),
                ElevatedButton(
                  onPressed: controller.pickFiles,
                  child: Text(AppLocalizations.of(context)!.files_upload),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Obx(() => controller.loading.value == false
                    ? ButtonWithIcon(
                        width: 350,
                        height: 45,
                        onPressed: () {
                          if (controller.pickedFiles.isEmpty) {
                            controller.showError.value = true;
                          } else {
                            controller.showError.value = false;
                            controller.sendLoanApplication(
                                controller.fullname.value.text,
                                controller.cinEd.value.text,
                                int.parse(controller.age.value.text),
                                controller.phoneEd.value.text,
                                controller.nationalite.value.text,
                                controller.actvityType.value.text,
                                controller.activityAdresse.value.text,
                                controller
                                    .activityexperienceDuration.value.text,
                                controller.governorat.value.text,
                                controller.AcitvityController.value.text,
                                double.parse(controller.amount.value.text),
                                controller.loanpurpose.value.text,
                                controller.pickedFiles.value);
                          }
                        },
                        text: AppLocalizations.of(context)!.send_application,
                        fontSize: 20,
                        mainColor: MyColors.MainGreenColor,
                        textcolor: Colors.white,
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          color: MyColors.MainGreenColor,
                        ),
                      )),
                SizedBox(
                  height: 10,
                ),
                Obx(() => Visibility(
                      visible: controller.showError.value,
                      child: Text(
                        AppLocalizations.of(context)!.upload_proof_documents,
                        style: TextStyle(
                            fontSize: 16,
                            color: MyColors.MainRedBig,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
          );
        default:
          return Text(AppLocalizations.of(context)!.unknown_status,
              style: TextStyle(color: Colors.grey, fontSize: 24));
      }
    }

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
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomSliverAppBarDelegate(
                minHeight: 80.h,
                maxHeight: 80.h,
                child: Appbar(
                  name: "",
                  paddingtop: 30,
                  title: AppLocalizations.of(context)!.categoriesGetALoan,
                  onPressedMenu: () {},
                  onPressedNotification: () {},
                ),
              ),
            ),
            SliverList.list(children: [
              Column(
                children: [
                  Obx(() => controller.showSteps == true
                      ? EasyStepper(
                          lineStyle: LineStyle(
                              lineLength: 70,
                              lineSpace: 0,
                              lineType: LineType.dotted,
                              defaultLineColor:
                                  MyColors.MainGrey.withOpacity(.4),
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
                                    backgroundColor:
                                        controller.currentStep.value == 0
                                            ? MyColors.SecondGreenColor
                                            : controller.currentStep.value > 0
                                                ? MyColors.MainGreenColor
                                                : Colors.grey,
                                  ),
                                ),
                                customTitle: Text(
                                  AppLocalizations.of(context)!.privacy_policy,
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
                                    backgroundColor:
                                        controller.currentStep.value == 1
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
                                    backgroundColor:
                                        controller.currentStep.value == 2
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
                                    backgroundColor:
                                        controller.currentStep.value == 3
                                            ? MyColors.SecondGreenColor
                                            : controller.currentStep.value > 3
                                                ? MyColors.MainGreenColor
                                                : Colors.grey,
                                  ),
                                ),
                                customTitle: Text(
                                  AppLocalizations.of(context)!
                                      .upload_proof_step,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: controller.currentStep.value == 3
                                          ? MyColors.SecondGreenColor
                                          : controller.currentStep.value > 3
                                              ? MyColors.MainGreenColor
                                              : Colors.grey),
                                )),
                          ],
                          onStepReached: (index) =>
                              controller.currentStep.value = index,
                        )
                      : SizedBox.shrink()),
                  Obx(() => controller.showSteps == true
                      ? _buildContentBasedOnStatus(controller.currentStep.value)
                      : SizedBox.shrink()),
                  Obx(() => controller.showSteps == false &&
                          controller.showDetails.value == false
                      ? GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing:
                                      5, // Spacing between columns
                                  mainAxisSpacing: 10.0,
                                  crossAxisCount: 2,
                                  childAspectRatio: .9),
                          shrinkWrap: true,
                          padding: EdgeInsets.all(15),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: catList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                controller.showDetails.value = true;
                                controller.currentCatIndex.value = index;
                              },
                              child: LoanCatgeroieWidget(
                                  image: images[index],
                                  title: catList[index].title,
                                  description1: catList[index].description1,
                                  description2: catList[index].description2),
                            );
                          })
                      : SizedBox.shrink()),
                  Obx(() => controller.showDetails.value == true &&
                          controller.showSteps.value == false
                      ? CategoryDetails(
                          controller: controller,
                          list: catList,
                          index: controller.currentCatIndex.value,
                          listImages: images)
                      : SizedBox.shrink())
                ],
              )
            ])
          ],
        ),
      ),
    );
  }
}
