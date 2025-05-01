import 'package:get/get.dart';
import 'package:investment_app/presentation/screens/Boarding/boarding_screen.dart';
import 'package:investment_app/presentation/screens/FAQ/faq_screen.dart';
import 'package:investment_app/presentation/screens/Mixed%20Quick%20Actions/mixed_quick_actions.dart';
import 'package:investment_app/presentation/screens/My%20Tokens/custom%20amount/custom_amount_screen.dart';
import 'package:investment_app/presentation/screens/QR%20Buy%20APX/qr_apx_buy_screen.dart';
import 'package:investment_app/presentation/screens/Splash/splash_screen.dart';
import 'package:investment_app/presentation/screens/about/about_apx_screen.dart';
import 'package:investment_app/presentation/screens/home/home_screen.dart';
import 'package:investment_app/presentation/screens/join%20the%20movement/join_the_movement_screen.dart';
import 'package:investment_app/presentation/screens/kyc/kyc_screen.dart';
import 'package:investment_app/presentation/screens/login/login_screen.dart';
import 'package:investment_app/presentation/screens/login/otp/otp_screen.dart';
import 'package:investment_app/presentation/screens/refer%20and%20earn/refer_and_earn_screen.dart';
import 'package:investment_app/presentation/screens/widgets/bottom_navbar.dart';
import '../../presentation/screens/token/apx_token_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: AppRoutes.boarding,
      page: () => BoardingScreen(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => OTPVerificationScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.navbar,
      page: () => const BottomNavbar(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.apxtoken,
      page: () => const BuyAPXTokenScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.scanner,
      page: () => const QrApxBuyScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.refer,
      page: () => const ReferAndEarnScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.mix,
      page: () => const MixedQuickActions(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.joy,
      page: () => const JoinTheMovementScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.kyc,
      page: () => const KycScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.about,
      page: () => const AboutApxScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.faq,
      page: () => const FaqScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.customApx,
      page: () => const CustomAmountScreen(),
      transition: Transition.rightToLeftWithFade,
    ),

  ];
}
