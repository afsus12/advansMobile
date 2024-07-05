import 'package:advans_app/Data/Controllers/ClientHomeController.dart';
import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/CardTemplate.dart';
import 'package:advans_app/Widgets/CustomAppBar.dart';
import 'package:advans_app/Widgets/drawer.dart';

import 'package:advans_app/routes/routes_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:payment_card/payment_card.dart';

class HomeScreen extends GetView<ClientHomeController> {
  HomeScreen({super.key});
  final _advancedDrawerController = AdvancedDrawerController();
  List<Color> catColors = [
    Color(0xFFFFCF2F),
    Color(0XFF6FE08D),
    Color(0XFF61BDFD),
    Color(0XFFFC7F7F),
    Color(0XFFCB84FB),
  ];
  List<Widget> Iconslist = [
    Icon(
      Icons.mobile_screen_share,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.payments,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.chat,
      color: Colors.white,
      size: 30,
    ),
    Image.asset(
      "assets/images/loan.png",
      height: 40,
      width: 40,
      color: Colors.white,
    ),
    Image.asset(
      "assets/images/transaction.png",
      height: 40,
      width: 40,
      color: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<String> nameList = [
      AppLocalizations.of(context)!.categoriesMobileMoney,
      AppLocalizations.of(context)!.categoriesGetALoan,
      "Messages",
      "Manage Loans",
      "Transaction History"
    ];
    List<String> pageNames = [
      routesGuide.transferScreenClient,
      routesGuide.loanAppScreencClient,
      routesGuide.chatScreen,
      routesGuide.clientMangeLoanScreen,
      routesGuide.transactionHistoryScreen
    ];
    return AdvancedDrawer(
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
      drawer: SideMenu(),
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
                  center: false,
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
                    style:
                        TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Obx(() {
                    List<int> visibleIndexes = [];
                    for (int i = 0; i < nameList.length; i++) {
                      if (controller.Status.value == "NOT_ACTIVE") {
                        if (i == 1 || i == 2 || i == 3) {
                          visibleIndexes.add(i);
                        }
                      } else if (controller.Status.value == "ACTIVE") {
                        if (i != 1) {
                          visibleIndexes.add(i);
                        }
                      }
                    }
                    return controller.loading == false
                        ? GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, childAspectRatio: 1),
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
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                  Obx(() => Visibility(
                        visible: controller.Status.value == "ACTIVE",
                        child: Text(
                          AppLocalizations.of(context)!.yourCardsText,
                          style: TextStyle(
                              fontSize: 23.sp, fontWeight: FontWeight.w600),
                        ),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  /*     Obx(() => Visibility(
                        visible: controller.Status.value == "ACTIVE",
                        child: Center(
                            child: Obx(() => CardTemplate(
                                name: controller.name +
                                    "  " +
                                    controller.lname.value))),
                      )) */
                  Obx(() => Visibility(
                        visible: controller.Status.value == "ACTIVE",
                        child: Center(
                          child: PaymentCard(
                            cardIssuerIcon: const CardIcon(
                                icon: "assets/images/postTunisie.png"),
                            backgroundColor: Colors.green,
                            currency: Text('TND'),
                            cardNumber: '1234567890123456',
                            validity: '09/25',
                            holder:
                                controller.name + "  " + controller.lname.value,
                            isStrict: false,
                            cardNetwork: CardNetwork.mastercard,
                            cardTypeTextStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            cardNumberStyles: CardNumberStyles.darkStyle5,
                            backgroundImage: null,
                          ),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
