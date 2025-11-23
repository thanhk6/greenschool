import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:green_school/router/screen_controller.dart';
import 'package:green_school/router/screen_name.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: ScreenNames.splash,
      getPages: AppScreens.screens,
    );
  }
}
