import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vaulta/screen/auth/forget_password/forget_passowrd.dart';
import 'package:vaulta/screen/auth/forget_password/reset_password.dart';
import 'package:vaulta/screen/auth/forget_password/success_reset_password.dart';
import 'package:vaulta/screen/auth/forget_password/verify_code.dart';
import 'package:vaulta/screen/auth/login.dart';
import 'package:vaulta/screen/auth/signup.dart';
import 'package:vaulta/screen/auth/success_sign_up.dart';
import 'package:vaulta/screen/auth/verify_code_sign_up.dart';
import 'package:vaulta/screen/exchange.dart';
import 'package:vaulta/screen/home.dart';
import 'package:vaulta/screen/home_page.dart';
import 'package:vaulta/screen/language.dart';
import 'package:vaulta/screen/onboarding.dart';
import 'package:vaulta/screen/settings/app_info.dart';
import 'package:vaulta/screen/settings/edit_profile.dart';
import 'package:vaulta/screen/settings/language_profile.dart';
import 'package:vaulta/screen/settings/profile_infromation.dart';
import 'package:vaulta/screen/settings/settings.dart';
import 'package:vaulta/screen/transaction_report.dart';
import 'package:vaulta/screen/transfer/confirm_transaction.dart';
import 'package:vaulta/screen/transfer/success_transfer.dart';
import 'package:vaulta/screen/transfer/transfer.dart';
import 'package:vaulta/screen/withdraw/success_withdraw.dart';
import 'package:vaulta/screen/withdraw/withdraw.dart';

import 'core/constant/routes.dart';
import 'middleware/my_middleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: '/', page: () => const Language(), middlewares: [MyMiddleware()]),
  GetPage(name: AppRoute.login, page: () => Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoute.verifiedCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.onboarding, page: () => const Onboarding()),
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
  GetPage(name: AppRoute.language, page: () => const Language()),
  GetPage(name: AppRoute.transfer, page: () => const TransferScreen()),
  GetPage(
      name: AppRoute.successTransfer,
      page: () => const SuccessTransferScreen()),
  GetPage(
      name: AppRoute.confirmTransfer,
      page: () => const ConfirmTransactionScreen()),
  GetPage(
      name: AppRoute.transactionReport, page: () => TransactionReportScreen()),
  GetPage(name: AppRoute.homePage, page: () => const HomePage()),
  GetPage(name: AppRoute.exchangeScreen, page: () => const ExchangeScreen()),
  GetPage(name: AppRoute.settingsScreen, page: () => const SettingsScreen()),
  GetPage(
      name: AppRoute.profileInfromationScreen,
      page: () => const ProfileInfromationScrenn()),
  GetPage(
      name: AppRoute.editProfileScreen, page: () => EditProfileScreen()),
  GetPage(
      name: AppRoute.languageProfileScreen,
      page: () => const LanguageProfileScreen()),
  GetPage(name: AppRoute.appInfoScreen, page: () => const AppInfoScreen()),
  GetPage(name: AppRoute.withdrawScreen, page: () => const WithdrawScreen()),
  GetPage(
      name: AppRoute.successWithdrawScreen,
      page: () => const SuccessWithdraw()),
];

// Map<String, Widget Function(BuildContext)> routes = {
//   // auth
//   AppRoute.login: (context) => const Login(),
//   AppRoute.signUp: (context) => const SignUp(),
//   AppRoute.forgetPassword: (context) => const ForgetPassword(),
//   AppRoute.resetPassword: (context) => const ResetPassword(),
//   AppRoute.verifiedCode: (context) => const VerifyCode(),
//   AppRoute.successResetPassword: (context) => const SuccessResetPassword(),
//   AppRoute.successSignUp: (context) => const SuccessSignUp(),
//   AppRoute.verifyCodeSignUp: (context) => const VerifyCodeSignUp(),
//
//   // onboarding
//   AppRoute.onboarding: (context) => const Onboarding(),
// };
