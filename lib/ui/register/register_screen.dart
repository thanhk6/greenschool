import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:green_school/remote/model/register/create_user_model.dart';
import 'package:green_school/remote/model/register/register_model.dart';
import 'package:green_school/remote/response/api_response.dart';
import 'package:green_school/ui/controller/auth_view_model.dart';
import 'package:green_school/utils/app_const.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthViewModel viewModel = Get.find<AuthViewModel>();

  final box = GetStorage();

  TextEditingController usernameController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

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
              SvgPicture.asset("assets/ic_splash.svg", height: 250),
              const SizedBox(height: 100),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: fullnameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Tên người dùng",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                obscureText: true,
                controller: passwordController,
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
              const SizedBox(height: 15),
              TextField(
                controller: passwordConfirmController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Nhập lại mật khẩu",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    createAccount();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Tạo tài khoản"),
                ),
              ),
              Obx(() {
                return viewModel.registerResponse.value.when(
                  loading: () => Container(),
                  success: (data) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      String title = "";
                      String content = "";
                      if (data.data is RegisterDataFailed) {
                        title = "Có lỗi xảy ra!!";
                        content = data.message.toString();
                      } else {
                        title = data.message.toString();
                        content =
                            "Hãy quay về màn hình đăng nhập và dùng tải khoản của bạn để đăng nhập vào ứng dụng.";
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(title),
                            content: Text(content),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  debugPrint("OK DIALOG");
                                  Navigator.of(
                                    context,
                                    rootNavigator: true,
                                  ).pop();
                                  enterLogin(data);
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
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showToast(message);
                    });
                    return Container();
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  createAccount() {
    if (usernameController.text.isNotEmpty) {
      if (passwordController.text.isNotEmpty &&
          fullnameController.text.isNotEmpty &&
          passwordConfirmController.text.isNotEmpty) {
        if (passwordController.text == passwordConfirmController.text) {
          viewModel.register(
            model: CreateUserModel(
              fullName: fullnameController.text,
              phoneNumber: "string",
              userName: usernameController.text,
              passwordHash: "string",
              passwordSalt: "string",
              isActive: true,
              dob: "2025-10-21T14:52:02.955Z",
              password: passwordController.text,
            ),
          );
          box.write(AppConst.USER_FULL_NAME, fullnameController.text);
        } else {
          showToast("Mật khẩu xác thực không trùng nhau");
        }
      } else {
        showToast("Không được để trống mật khẩu hoặc tên người dùng");
      }
    } else {
      showToast("Không được để trống địa chỉ email");
    }
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

  void enterLogin(RegisterModel data) {
    Get.back();
  }

  confirmSuccess(RegisterModel data) {}
}

// WidgetsBinding.instance.addPostFrameCallback((_) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                         content: const Text('Đăng ký thành công!!'),
//                         action: SnackBarAction(
//                           label: 'Đăng nhập',
//                           onPressed: Get.back,
//                         ),
//                         duration: const Duration(days: 100),
//                       )
//                       );
//                     });
