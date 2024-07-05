import 'package:advans_app/Data/Controllers/ClientManageLoansController.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/CustomAppBar.dart';
import 'package:advans_app/Widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:advans_app/routes/routes_guide.dart';

class ClientMangeLoansScreen extends GetView<ClientManageLoansController> {
  ClientMangeLoansScreen({super.key});
  List<Color> catColors = [
    Color(0XFF6FE08D),
    Color(0xFFFFCF2F),
    Color(0XFF61BDFD),
    Color(0XFFFC7F7F),
    Color(0XFFCB84FB),
  ];
  List<Image> Iconslist = [
    Image.asset(
      "assets/images/1.png",
      height: 40,
      width: 40,
      color: Colors.white,
    ),
    Image.asset(
      "assets/images/scroll.png",
      height: 40,
      width: 40,
      color: Colors.white,
    ),
    Image.asset(
      "assets/images/2.png",
      height: 40,
      width: 40,
      color: Colors.white,
    )
  ];
  @override
  Widget build(BuildContext context) {
    final _advancedDrawerController = AdvancedDrawerController();
    List<String> nameList = [
      AppLocalizations.of(context)!.categoriesGetALoan,
      "Track loan applications",
      "Loan Repayment"
    ];
    List<String> pageNames = [
      routesGuide.loanAppScreencClient,
      routesGuide.trackLoanApplicationsScreen,
      routesGuide.clientactifloansScreen,
    ];
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
          body: CustomScrollView(slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: CustomSliverAppBarDelegate(
            minHeight: 80.h,
            maxHeight: 80.h,
            child: Appbar(
              name: "",
              paddingtop: 30,
              title: "Loan Menu",
              onPressedMenu: () {},
              onPressedNotification: () {},
            ),
          ),
        ),
        SliverList.list(children: [
          Obx(() {
            List<int> visibleIndexes = [];
            for (int i = 0; i < nameList.length; i++) {
              if (!(i == 0 && !controller.canDemand.value)) {
                visibleIndexes.add(i);
              }
            }
            return controller.loading == false
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 1.1),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: visibleIndexes.length,
                    itemBuilder: (context, index) {
                      int actualIndex = visibleIndexes[index];
                      return InkWell(
                        onTap: () {
                          if (actualIndex < pageNames.length) {
                            print(
                                "Tapped index: $actualIndex, Page name: ${pageNames[actualIndex]}");

                            Get.toNamed(pageNames[actualIndex]);
                          } else {
                            print("Index out of bounds: $actualIndex");
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 60.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                color: catColors[actualIndex],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Iconslist[actualIndex])),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Expanded(
                              child: Text(
                                nameList[actualIndex],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  overflow: TextOverflow.clip,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(.7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    })
                : CircularProgressIndicator(
                    color: Colors.blue,
                  );
          })
        ])
      ])),
    );
  }
}
