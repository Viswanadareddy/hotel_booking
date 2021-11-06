import 'package:get/get.dart';
import 'package:hotel_booking/Screens/auth_wrapper.dart';
import 'package:hotel_booking/Screens/forgot_passsord.dart';
import 'package:hotel_booking/Screens/hotel_details.dart';
import 'package:hotel_booking/Screens/login_screen.dart';
import 'package:hotel_booking/Screens/onboarding_screen.dart';
import 'package:hotel_booking/Screens/otp_screen.dart';
import 'package:hotel_booking/Screens/signup_screen.dart';
import 'package:hotel_booking/Screens/wrapper.dart';

class PageRoutes {
  static List<GetPage> pages = [
    //GetPage(name: '/', page: () => const Wrapper()),
    //GetPage(name: '/AuthWrapper', page: () => const AuthWrapper()),
    //GetPage(name: '/Login', page: () => const LoginScreen()),
    //GetPage(name: '/Signup', page: () => const SignUpScreen()),
    //GetPage(name: '/OTP', page: () => const OTPScreen()),
    //GetPage(name: '/OnBoarding', page: () => const OnboardingScreen()),
    //GetPage(name: '/ForgotPassword', page: () => const ForgotPasswordScreen()),
    GetPage(name: '/HotelDetails', page: () => const HotelDetailsScreen()),
  ];
}
