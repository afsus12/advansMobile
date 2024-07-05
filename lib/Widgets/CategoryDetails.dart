import 'package:advans_app/Data/Controllers/ClientLoanApplicationController.dart';
import 'package:advans_app/Models/CategoryModel.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/LoanCategorieWidget.dart';
import 'package:advans_app/Widgets/buttonwithicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryDetails extends StatelessWidget {
  final List<Category> list;
  final int index;
  final List<String> listImages;
  final ClientLonaApplicationController controller;
  const CategoryDetails(
      {super.key,
      required this.list,
      required this.index,
      required this.listImages,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
/*         LoanCatgeroieWidget(
            width: 250,
            image: listImages[index],
            title: list[index].title,
            padding: 20,
            center: true,
            description1: list[index].description1,
            description2: list[index].description2),
        SizedBox(
          height: 10.h,
        ), */
        Container(
          padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 30),
          /*     decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MyColors.inputcolorfill.withOpacity(0.7)), */
          width: ScreenUtil.defaultSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  list[index].title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily:
                        'CoolFont', // Replace 'CoolFont' with your preferred cool font
                  ),
                ),
              ),
              Center(child: SvgPicture.asset(listImages[index])),
              SizedBox(height: 16),
              Text(
                list[index].detailScreenTitle,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                list[index].detailScreenDetails,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  textAlign: TextAlign.left,
                  list[index].detailedDescription,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  list[index].eligibilityTitle,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: list[index]
                    .eligibilityCriteria
                    .map(
                      (criteria) => Text(
                        '- $criteria',
                        style: TextStyle(fontSize: 14),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  list[index].conditionsTitle,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: list[index]
                    .conditions
                    .map(
                      (condition) => Text(
                        '- $condition',
                        style: TextStyle(fontSize: 14),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                height: 10.h,
              ),
              ButtonWithIcon(
                onPressed: () {
                  controller.showSteps.value = true;
                },
                text: AppLocalizations.of(context)!.proceed,
                textcolor: Colors.white,
                mainColor: MyColors.MainGreenColor,
              )
            ],
          ),
        )
      ],
    ));
  }
}
