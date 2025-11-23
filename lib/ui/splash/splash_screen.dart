import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:green_school/router/screen_name.dart';
import 'package:green_school/utils/app_const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final box = GetStorage();
  String _userToken = "";

  @override
  void initState() {
    super.initState();
    _userToken = box.read(AppConst.USER_TOKEN) ?? '';
    debugPrint("_userToken: $_userToken");
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 2), () {
      if (_userToken.isEmpty) {
        Get.offNamed(ScreenNames.login);
      } else {
        Get.offNamed(ScreenNames.base);
      }
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const LoginScreen()),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: Center(
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/ic_logo.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
