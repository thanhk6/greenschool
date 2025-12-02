import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:green_school/remote/model/login/login_model.dart';
import 'package:green_school/remote/response/api_response.dart';
import 'package:green_school/router/screen_name.dart';
import 'package:green_school/ui/controller/auth_view_model.dart';
import 'package:shimmer/shimmer.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  AuthViewModel viewModel = Get.find<AuthViewModel>();

  final box = GetStorage();

  TextEditingController tokenController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/ic_logo.png", height: 250),
              const SizedBox(height: 150),
              TextField(
                controller: tokenController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Mã đặt mật khẩu",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Mật khẩu mới",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: rePasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Nhập lại mật khẩu mới",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Obx(() {
                return viewModel.resetPasswordResponse.value.when(
                  loading: () => Container(),
                  success: (data) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      String title = data.message;
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(title),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  debugPrint("OK DIALOG");
                                  Navigator.of(
                                    context,
                                    rootNavigator: true,
                                  ).pop();
                                  viewModel.resetPasswordResponse.value =
                                      ApiResponse.loading();
                                  Get.back();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    });
                    return Container();
                  },
                  error: (message) {
                    debugPrint("REGISTER ERROR $message");
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showToast(message);
                    });
                    return Container();
                  },
                );
              }),
              const SizedBox(height: 15),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    if (tokenController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty &&
                        rePasswordController.text.isNotEmpty) {
                      if (passwordController.text ==
                          rePasswordController.text) {
                        viewModel.resetPassword(
                          token: tokenController.text,
                          newPassword: passwordController.text,
                        );
                      } else {
                        showToast("Mật khẩu xác nhận không giống nhau");
                      }
                    } else {
                      showToast(
                        "Không được để trống địa chỉ email hoặc mật khẩu",
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Gửi"),
                ),
              ),
            ],
          ),
        ),
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

  loadingRequest() {}

  enterHome(LoginModel response) {
    debugPrint("LOGIN SUCCESS: ${response.data}");
    Get.offNamed(ScreenNames.base);
  }

  Expanded buildShimmerEffect() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: SizedBox(
              height: 30,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.grey[300],
                  width: double.infinity,
                  child: const Text(
                    '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
