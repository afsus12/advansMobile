import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/big_text.dart';
import 'package:advans_app/routes/routes_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Container(
            child: ListTileTheme(
      textColor: Colors.white,
      iconColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              width: 128.0,
              height: 128.0,
              margin: const EdgeInsets.only(
                top: 24.0,
                bottom: 20,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.black26,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                "assets/images/svglogo.svg",
                fit: BoxFit.fill,
              )),
          BigText(
            text: AppLocalizations.of(context)!.appname,
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Divider(
            color: MyColors.inputcolorfill.withOpacity(0.4),
            indent: 40,
            endIndent: 40,
            thickness: 1,
            height: 0.6,
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Expanded(
            flex: 4,
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.mobile_screen_share),
                  title:
                      Text(AppLocalizations.of(context)!.categoriesMobileMoney),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.payments),
                  title: Text(AppLocalizations.of(context)!.categoriesGetALoan),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.currency_exchange),
                  title:
                      Text(AppLocalizations.of(context)!.categoriesTransfers),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.savings),
                  title:
                      Text(AppLocalizations.of(context)!.categoriesSaveInvest),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.payment),
                  title: Text(AppLocalizations.of(context)!.payBills),
                ),
                ListTile(
                  onTap: () {
                    Get.offAllNamed(routesGuide.onLanding);
                  },
                  leading: Icon(Icons.logout),
                  title: Text(AppLocalizations.of(context)!.logout),
                )
              ],
            ),
          ),
          Spacer(),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: 12,
              color: Colors.white54,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              child: Text('Terms of Service | Privacy Policy'),
            ),
          ),
        ],
      ),
    )));
  }
}
