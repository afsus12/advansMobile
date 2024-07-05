import 'package:advans_app/Data/Bindings/Client/ClientActifLoansBindings.dart';
import 'package:advans_app/Data/Bindings/Client/ClientHomeScreenBindings.dart';
import 'package:advans_app/Data/Bindings/Client/ClientLoanApplicationBindings.dart';
import 'package:advans_app/Data/Bindings/Client/ClientLoginBindings.dart';
import 'package:advans_app/Data/Bindings/Client/ClientMangeLoansBindings.dart';
import 'package:advans_app/Data/Bindings/Client/ClientRepaymentMilesStoneBindings.dart';
import 'package:advans_app/Data/Bindings/Client/ClientSignupBindings.dart';
import 'package:advans_app/Data/Bindings/Client/ClientTrackLoanApplication.Binding.dart';
import 'package:advans_app/Data/Bindings/Client/ClientTransferBindings.dart';
import 'package:advans_app/Data/Bindings/Client/ManageAccountBinding.dart';
import 'package:advans_app/Data/Bindings/Client/ManageLoanDetailsBindings.dart';
import 'package:advans_app/Data/Bindings/Client/ManageLoansBindings.dart';
import 'package:advans_app/Data/Bindings/Client/StaffHomeBindings.dart';
import 'package:advans_app/Data/Bindings/Client/StaffLoginBindings.dart';
import 'package:advans_app/Data/Bindings/Client/StaffOpertunityBindings.dart';
import 'package:advans_app/Data/Bindings/Client/StaffProspectBindings.dart';
import 'package:advans_app/Data/Bindings/Client/StaffSignupBindings.dart';
import 'package:advans_app/Data/Bindings/Client/TransactionHistoryBinding.dart';
import 'package:advans_app/Data/Bindings/Client/prospectListBindings.dart';
import 'package:advans_app/Screens/Client/authentification/ClientAuth.dart';
import 'package:advans_app/Screens/Client/authentification/LoginScreen.dart';
import 'package:advans_app/Screens/Client/authentification/SignupScreen.dart';
import 'package:advans_app/Screens/Client/features/ActifloansScreen.dart';
import 'package:advans_app/Screens/Client/features/ChatScreen.dart';
import 'package:advans_app/Screens/Client/features/ClientManageLoanScreen.dart';
import 'package:advans_app/Screens/Client/features/LoanApplicationScreen.dart';
import 'package:advans_app/Screens/Client/features/ManageAccountScreen.dart';
import 'package:advans_app/Screens/Client/features/RepaymentMileStones.dart';
import 'package:advans_app/Screens/Client/features/TrackLoanApplicationScreen.dart';
import 'package:advans_app/Screens/Client/features/TransactionHistoryScreen.dart';
import 'package:advans_app/Screens/Client/features/TransferScreen.dart';
import 'package:advans_app/Screens/Client/home/HomeScreen.dart';
import 'package:advans_app/Screens/LandingScreen.dart';
import 'package:advans_app/Screens/SplashScreen.dart';
import 'package:advans_app/Screens/Staff/authentification/StaffAuth.dart';
import 'package:advans_app/Screens/Staff/authentification/StaffLogin.dart';
import 'package:advans_app/Screens/Staff/authentification/StaffRegistration.dart';
import 'package:advans_app/Screens/Staff/features/ManageLoansScreen.dart';
import 'package:advans_app/Screens/Staff/features/MangeLoansDetails.dart';
import 'package:advans_app/Screens/Staff/features/OppertunityScreen.dart';
import 'package:advans_app/Screens/Staff/features/ProspectListScreen.dart';
import 'package:advans_app/Screens/Staff/features/ProspectScreen.dart';
import 'package:advans_app/Screens/Staff/home/StaffHomeScreen.dart';
import 'package:get/get.dart';

class routesGuide {
  static const String initial = "/";
  static const String onSplashScreen = "/splashScreen";
  static const String main = "/main";
  static const String onLanding = "/onLanding";
  static const String signInClient = "/signInClient";
  static const String signUpClient = "/signUpClient";
  static const String signInStaff = "/signInStaff";
  static const String signUpStaff = "/signUpStaff";
  static const String homeScreenStaff = "/HomeStaff";
  static const String homeScreenClient = "/HomeClient";
  static const String preospectStaff = "/ProspectStaff";
  static const String opertunityStaff = "/OpertunityStaff";
  static const String authScreenStaff = "/AuthScreenStaff";
  static const String authScreenClient = "/AuthScreenClient";
  static const String loanAppScreencClient = "/LoanAppScreenClient";
  static const String transferScreenClient = "/TransferScreenClient";
  static const String benificaryScreenClient = "/BenificaryScreenClient";
  static const String chatScreen = "/chatScreen";
  static const String mangeLoanScreen = "/mangeLoanScreen";
  static const String mangeLoanDetailScreen = "/mangeLoanDetailScreen";
  static const String prospectListScreen = "/prospectListScreen";
  static const String clientMangeLoanScreen = "/clientMangeLoanScreen";
  static const String clientactifloansScreen = "/clientactifloansScreen";
  static const String trackLoanApplicationsScreen =
      "/TrackLoanApplicationsScreen";
  static const String repaymentMilestonesScreen = "/repaymentMilestonesScreen";
  static const String transactionHistoryScreen = "/transactionHistoryScreen";
  static const String manageAccountScreen = "/manageAccountScreen";
  static String getManageAccountScreen() => manageAccountScreen;
  static String getTransactionHistoryScreen() => transactionHistoryScreen;
  static String getRepaymentMilestonesScreen() => repaymentMilestonesScreen;
  static String getTrackLoanApplicationsScreen() => trackLoanApplicationsScreen;
  static String getProspectListScreen() => prospectListScreen;
  static String getManageLoanDetailsScren() => mangeLoanDetailScreen;
  static String getChatScreen() => chatScreen;
  static String getManageLoanScreen() => mangeLoanScreen;
  static String getInitial() => initial;
  static String getMain() => main;
  static String getOnSplashScreen() => onSplashScreen;
  static String getOnLanding() => onLanding;
  static String getSignInClient() => signInClient;
  static String getSignUpClient() => signUpClient;
  static String getSignInStaff() => signInStaff;
  static String getSignUpStaff() => signUpStaff;
  static String getHomeScreenStaff() => homeScreenStaff;
  static String getHomeScreenClient() => homeScreenClient;
  static String getPreospectStaff() => preospectStaff;
  static String getOpertunityStaff() => opertunityStaff;
  static String getAuthScreenStaff() => authScreenStaff;
  static String getAuthScreenClient() => authScreenClient;
  static String getTransferScreenClient() => transferScreenClient;
  static String getBenificaryScreenClient() => benificaryScreenClient;
  static String getLoanAppScreenClient() => loanAppScreencClient;
  static String getClientManageLoanScreen() => clientMangeLoanScreen;
  static String getClientActifLoanScreen() => clientactifloansScreen;

  static List<GetPage> routes = [
    GetPage(
      name: getAuthScreenClient(),
      page: () => ClientAuth(),
/*       binding: OnLandingBinding(), */
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getAuthScreenStaff(),
      page: () => StaffAuthScreen(),
/*       binding: OnLandingBinding(), */
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getOnLanding(),
      page: () => LandingScreen(),
/*       binding: OnLandingBinding(), */
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getSignInClient(),
      page: () => LoginScreen(),
      binding: ClientSignInBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getSignUpClient(),
      page: () => SignupScreen(),
      binding: ClientSignupBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getSignInStaff(),
      page: () => StaffLoginScreen(),
      binding: StaffLoginBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getSignUpStaff(),
      page: () => StaffRegistrationScreen(),
      binding: StaffSignupBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getHomeScreenStaff(),
      page: () => StaffHomeScreen(),
      binding: StaffHomeBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getPreospectStaff(),
      page: () => ProspectScreen(),
      binding: StaffProspectBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getOpertunityStaff(),
      page: () => OpertunityScreen(),
      binding: StaffOpertunityBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getTransferScreenClient(),
      page: () => TransferScreen(),
      binding: ClientTransferBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getOnSplashScreen(),
      page: () => SplashScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getHomeScreenClient(),
      page: () => HomeScreen(),
      binding: ClientHomeBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getLoanAppScreenClient(),
      page: () => LoanAppScreen(),
      binding: ClientLoanApplicationBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getChatScreen(),
      page: () => ChatPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getManageLoanScreen(),
      binding: ManageLoansBinding(),
      page: () => ManageLoansScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getManageLoanDetailsScren(),
      binding: ManageLoanDetailsBindings(),
      page: () => ManageLoansDetailsScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getProspectListScreen(),
      binding: ProspectListBinding(),
      page: () => ProspectListScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getClientManageLoanScreen(),
      binding: ClientManageLoansBinding(),
      page: () => ClientMangeLoansScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getTrackLoanApplicationsScreen(),
      binding: TrackLoanApplicationsBinding(),
      page: () => TrackLoanApplicationsScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getClientActifLoanScreen(),
      binding: ClientActifLoansBinding(),
      page: () => ActifLoansScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getRepaymentMilestonesScreen(),
      binding: RepaymentMilestonesBinding(),
      page: () => RepaymentMileStonesScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getTransactionHistoryScreen(),
      binding: TransactionHistoryBinding(),
      page: () => TransactionHistoryScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: getManageAccountScreen(),
      binding: ManageAccountBinding(),
      page: () => ManageAccountScreen(),
      transition: Transition.cupertino,
    ),
  ];
}
