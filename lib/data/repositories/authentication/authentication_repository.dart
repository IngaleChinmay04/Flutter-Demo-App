import 'package:demo_app/features/authentication/screens/login/login.dart';
import 'package:demo_app/features/authentication/screens/onBoarding/onboarding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();


  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Functions to Show Relevant Screen
  void screenRedirect() async {
    // Local Storage
   deviceStorage.writeIfNull('IsFirstTime', true);
   deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const onBoardingScreen());

  }



}