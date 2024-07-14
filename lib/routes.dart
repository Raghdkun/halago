import 'package:get/get.dart';
import 'package:halago/core/constant/routes.dart';
import 'package:halago/core/middleware/mymiddleware.dart';
import 'package:halago/splashscreen.dart';
import 'package:halago/view/auth/forgetpassword.dart';
import 'package:halago/view/checklocation.dart';
import 'package:halago/view/home/home.dart';
import 'package:halago/view/languages/language.dart';
import 'package:halago/view/auth/login.dart';
import 'package:halago/view/auth/signin.dart';
import 'package:halago/view/auth/signup.dart';

import 'view/auth/verfiycode.dart';
import 'view/onboarding/screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => const SplashScreen(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
      name: AppRoute.language,
      page: () => const Language(),
      middlewares: [MyMiddleWare()],
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)),
  GetPage(
      name: AppRoute.onboarding,
      page: () => const Onbording(),
      // middlewares: [MyMiddleWare()],
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)),
  GetPage(
      name: AppRoute.checklocation,
      page: () => const CheckLocation(),
      // middlewares: [MyMiddleWare()],
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)),

  ///auth
  GetPage(
      name: AppRoute.login,
      page: () => const Login(),
      // middlewares: [MyMiddleWare()],
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)),
  GetPage(
      name: AppRoute.signup,
      page: () => const SignUp(),
      // middlewares: [MyMiddleWare()],
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)),
  GetPage(
      name: AppRoute.signin,
      page: () => const SignIn(),
      // middlewares: [MyMiddleWare()],
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
      name: AppRoute.forgetpassword,
      page: () => const ForgetPassword(),
      // middlewares: [MyMiddleWare()],
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)),
       GetPage(
      name: AppRoute.verfiycodepage,
      page: () => const VerfiyCodePage(),
      // middlewares: [MyMiddleWare()],
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)),

      ///home
      GetPage(
      name: AppRoute.home,
      page: () => const Home(),
      // middlewares: [MyMiddleWare()],
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)),
];
