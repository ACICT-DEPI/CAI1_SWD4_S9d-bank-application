import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vaulta/screen/auth/forget_password/forget_passowrd.dart';
import 'package:vaulta/screen/auth/forget_password/reset_password.dart';
import 'package:vaulta/screen/auth/forget_password/success_reset_password.dart';
import 'package:vaulta/screen/auth/forget_password/verify_code.dart';
import 'package:vaulta/screen/auth/login.dart';
import 'package:vaulta/screen/auth/signup.dart';
import 'package:vaulta/screen/auth/success_sign_up.dart';
import 'package:vaulta/screen/auth/verify_code_sign_up.dart';
import 'package:vaulta/screen/language.dart';
import 'package:vaulta/screen/onboarding.dart';

import 'core/constant/routes.dart';
import 'middleware/my_middleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: '/', page: () => const Language(), middlewares: [MyMiddleware()]),
  GetPage(name: AppRoute.login, page: () => const Login()),
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
