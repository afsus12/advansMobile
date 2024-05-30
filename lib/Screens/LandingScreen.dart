import 'package:advans_app/Screens/LoginScreen.dart';
import 'package:advans_app/Screens/SignupScreen.dart';
import 'package:advans_app/Utils/myColors.dart';
import 'package:advans_app/Widgets/big_text.dart';
import 'package:advans_app/Widgets/buttonwithicon.dart';
import 'package:advans_app/bloc/landing/landing_bloc.dart';
import 'package:advans_app/bloc/landing/landing_event.dart';
import 'package:advans_app/bloc/landing/landing_state.dart';
import 'package:advans_app/commons/customShapes/Tcontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 10),
                              child: Text(
                                AppLocalizations.of(context)!.textSigninButton,
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
                        Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.h, vertical: 10),
                              child: Text(
                                AppLocalizations.of(context)!.textSignupButton,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        BlocConsumer<LanguageBloc, LanguageState>(
                            listener: (context, state) {
                          // This listener is called whenever the bloc state changes
                        }, builder: (context, State) {
                          return Container(
                              height: 80.h,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BlocBuilder<LanguageBloc, LanguageState>(
                                        builder: (context, state) {
                                      return CircleAvatar(
                                          foregroundImage: AssetImage(
                                            state.imagePath,
                                          ),
                                          radius: 20.sp,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage:
                                              AssetImage(state.imagePath));
                                    }),
                                    Expanded(
                                      child: IconButton(
                                        icon: Icon(Icons.change_circle_rounded,
                                            color: MyColors.SecondGreenColor,
                                            size: 30),
                                        onPressed: () {
                                          final bloc =
                                              context.read<LanguageBloc>();
                                          final currentState =
                                              bloc.state.languageCode;
                                          if (currentState == 'en') {
                                            BlocProvider.of<LanguageBloc>(
                                                    context)
                                                .add(ChangeLanguage("fr"));
                                            Locale('fr');
                                          } else if (currentState == 'fr') {
                                            BlocProvider.of<LanguageBloc>(
                                                    context)
                                                .add(ChangeLanguage("ar"));
                                            Locale('ar');
                                          } else {
                                            BlocProvider.of<LanguageBloc>(
                                                    context)
                                                .add(ChangeLanguage("en"));
                                            Locale('en');
                                          }
                                        },
                                      ),
                                    ),
                                  ]));
                        })
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
