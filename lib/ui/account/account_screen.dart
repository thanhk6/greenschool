import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:green_school/remote/response/api_response.dart';
import 'package:green_school/router/screen_name.dart';
import 'package:green_school/ui/controller/auth_view_model.dart';
import 'package:green_school/utils/app_const.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  AuthViewModel viewModel = Get.find<AuthViewModel>();
  final box = GetStorage();
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
                          box.write(AppConst.USER_TOKEN, "");
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
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Bạn có muốn xóa tài khoản?'),
                    content: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Mật khẩu",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                          if (_passwordController.text.isNotEmpty) {
                            viewModel.deleteAccount(
                              password: _passwordController.text,
                            );
                          } else {
                            showToast('Vui lòng điền mật khẩu');
                          }
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
                  "Xóa tài khoản",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ),
          Obx(() {
            return viewModel.deleteAccountResponse.value.when(
              loading: () => Container(),
              success: (data) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (data.statusCode == 200) {
                    viewModel.deleteAccountResponse.value =
                        ApiResponse.loading();
                    box.write(AppConst.USER_TOKEN, "");
                    enterLogin();
                  } else {
                    debugPrint('STATUS_CODE 400');
                    showToast(data.message);
                  }
                });
                return Container();
              },
              error: (message) {
                debugPrint('ERROR: $message !!!!!!!!!!!!!');
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showToast(message);
                });
                return Container();
              },
            );
          }),
        ],
      ),
    );
  }

  showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void enterLogin() {
    GetStorage().write(AppConst.USER_TOKEN, '');
    Get.offNamed(ScreenNames.login);
  }
}
