import 'package:advans_app/Screens/HomeScreen.dart';
import 'package:advans_app/Screens/LoginScreen.dart';
import 'package:advans_app/Screens/LandingScreen.dart';
import 'package:advans_app/Screens/SplashScreen.dart';
import 'package:advans_app/bloc/landing/landing_bloc.dart';
import 'package:advans_app/bloc/landing/landing_event.dart';
import 'package:advans_app/bloc/landing/landing_state.dart';
import 'package:advans_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return BlocProvider<LanguageBloc>(
              create: (context) => LanguageBloc(),
              child: BlocBuilder<LanguageBloc, LanguageState>(
                  builder: (context, state) {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Advans Client App',
                  theme: ThemeData(
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true,
                  ),
                  supportedLocales: l10n.all,
                  locale: Locale(state.languageCode, ''),
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    // Add custom or other necessary delegates here
                  ],
                  home: SplashScreen(),
                );
              }));
        });
  }
}
