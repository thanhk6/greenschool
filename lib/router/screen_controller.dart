import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:green_school/router/screen_name.dart';
import 'package:green_school/ui/account/account_screen.dart';
import 'package:green_school/ui/account/account_screen_bindings.dart';
import 'package:green_school/ui/base/base_screen.dart';
import 'package:green_school/ui/base/base_screen_binding.dart';
import 'package:green_school/ui/event/event_screen.dart';
import 'package:green_school/ui/event/event_screen_binding.dart';
import 'package:green_school/ui/history/history_screen.dart';
import 'package:green_school/ui/history/history_screen_binding.dart';
import 'package:green_school/ui/home/home_screen.dart';
import 'package:green_school/ui/home/home_screen_binding.dart';
import 'package:green_school/ui/login/login_binding.dart';
import 'package:green_school/ui/login/login_screen.dart';
import 'package:green_school/ui/register/register_binding.dart';
import 'package:green_school/ui/register/register_screen.dart';
import 'package:green_school/ui/reward/reward_history.dart';
import 'package:green_school/ui/reward/reward_screen.dart';
import 'package:green_school/ui/reward/reward_screen_bindings.dart';
import 'package:green_school/ui/scan/qr_scan_binding.dart';
import 'package:green_school/ui/scan/qr_scan_screen.dart';
import 'package:green_school/ui/splash/splash_screen.dart';

abstract class AppScreens {
  static final screens = <GetPage>[
    GetPage(name: ScreenNames.splash, page: () => const SplashScreen()),
    GetPage(
      name: ScreenNames.login,
      page: () => const LoginScreen(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: ScreenNames.register,
      page: () => const RegisterScreen(),
      bindings: [RegisterBinding()],
    ),
    GetPage(
      name: ScreenNames.base,
      page: () => const BaseScreen(),
      bindings: [BaseScreenBinding()],
    ),
    GetPage(
      name: ScreenNames.qrscanner,
      page: () => const QRScannerScreen(),
      bindings: [QrScanBinding()],
    ),
    GetPage(
      name: ScreenNames.event,
      page: () => EventScreen(),
      bindings: [EventScreenBinding()],
    ),
    GetPage(
      name: ScreenNames.history,
      page: () => const HistoryScreen(),
      bindings: [HistoryScreenBinding()],
    ),
    GetPage(
      name: ScreenNames.home,
      page: () => const HomeScreen(),
      bindings: [HomeScreenBinding()],
    ),
    GetPage(
      name: ScreenNames.account,
      page: () => const AccountScreen(),
      bindings: [AccountScreenBindings()],
    ),
    GetPage(
      name: ScreenNames.rewards,
      page: () => RewardScreen(),
      bindings: [RewardScreenBindings()],
    ),
    GetPage(
      name: ScreenNames.rewardHistory,
      page: () => RewardHistory(),
      bindings: [RewardScreenBindings()],
    ),
  ];
}
