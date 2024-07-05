import 'package:advans_app/Data/Controllers/StaffHomeController.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/CustomAppBar.dart';
import 'package:advans_app/Widgets/drawer.dart';
import 'package:advans_app/Widgets/drawerStaff.dart';
import 'package:advans_app/routes/routes_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class StaffHomeScreen extends GetView<StaffHomeController> {
  StaffHomeScreen({super.key});
  final _advancedDrawerController = AdvancedDrawerController();
  List<Color> catColors = [
    Color(0xFFFFCF2F),
    Color(0XFF6FE08D),
    Color(0XFF61BDFD),
    Color(0XFFFC7F7F),
/*    Color(0XFFCB84FB), */
  ];
  List<Icon> Iconslist = [
    Icon(
      Icons.add_reaction,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.add_chart,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.manage_search,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.manage_search,
      color: Colors.white,
      size: 30,
    )
  ];
  @override
  Widget build(BuildContext context) {
    List<String> nameList = [
      AppLocalizations.of(context)!.createProspect,
      AppLocalizations.of(context)!.createOpportunity,
      "Manage Loans",
      "manage Prospect"
    ];
    List<String> pageNames = [
      routesGuide.preospectStaff,
      routesGuide.opertunityStaff,
      routesGuide.mangeLoanScreen,
      routesGuide.prospectListScreen
    ];
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
          body: ListView(
            children: [
              Obx(() => Appbar(
                    name: controller.name.value,
                    onPressedMenu: () => _advancedDrawerController.showDrawer(),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.quickActionsText,
                      style: TextStyle(
                          fontSize: 23.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1.1),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: nameList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Get.toNamed(pageNames[index]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 50.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                      color: catColors[index],
                                      shape: BoxShape.circle),
                                  child: Center(child: Iconslist[index]),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Expanded(
                                  child: Text(
                                    nameList[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        overflow: TextOverflow.clip,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(.7)),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
