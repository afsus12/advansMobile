import 'package:advans_app/Utils/myColors.dart';
import 'package:advans_app/Widgets/CardTemplate.dart';
import 'package:advans_app/Widgets/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Color> catColors = [
    Color(0xFFFFCF2F),
    Color(0XFF6FE08D),
    Color(0XFF61BDFD),
    Color(0XFFFC7F7F),
    Color(0XFFCB84FB),
  ];
  List<Icon> Iconslist = [
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
      Icons.currency_exchange,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.savings_rounded,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.payment,
      color: Colors.white,
      size: 30,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<String> nameList = [
      AppLocalizations.of(context)!.categoriesMobileMoney,
      AppLocalizations.of(context)!.categoriesGetALoan,
      AppLocalizations.of(context)!.categoriesTransfers,
      AppLocalizations.of(context)!.categoriesSaveInvest,
      AppLocalizations.of(context)!.payBills
    ];
    return Scaffold(
        body: ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
          decoration: BoxDecoration(
              color: MyColors.MainGreenColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.dashboard,
                    size: 30.h,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.notifications,
                    size: 30.h,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 3, bottom: 15),
                child: Text(
                  AppLocalizations.of(context)!.greetingUser("yassine"),
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white),
                ),
              ),
              //Search bar i can add
              /*    Container(
                margin: EdgeInsets.only(top: 5, bottom: 20),
                width: MediaQuery.of(context).size.width,
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Myinput(labelText: "Search"),
              ) */
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.quickActionsText,
                style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w600),
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
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: catColors[index], shape: BoxShape.circle),
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
                    );
                  }),
              SizedBox(
                height: 5.h,
              ),
              Text(
                AppLocalizations.of(context)!.yourCardsText,
                style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(child: CardTemplate())
            ],
          ),
        )
      ],
    ));
  }
}
