import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:green_school/router/screen_name.dart';
import 'package:green_school/utils/app_const.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(10, 60, 10, 20),
            alignment: Alignment.center,
            child: Text(
              "Cá nhân",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(ScreenNames.rewards);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              margin: const EdgeInsets.all(8),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                child: Text(
                  "Đổi quà",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(ScreenNames.rewardHistory);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              margin: const EdgeInsets.all(8),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                child: Text(
                  "Lịch sử đổi quà",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Bạn có muốn đăng xuất?'),
                    content: Text('Chuyển về màn hình đăng nhập'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                          enterLogin();
                        },
                        child: const Text('OK'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: const Text('CANCEL'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              margin: const EdgeInsets.all(8),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                child: Text(
                  "Đăng xuất",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void enterLogin() {
    GetStorage().write(AppConst.USER_TOKEN, '');
    Get.offNamed(ScreenNames.login);
  }
}
