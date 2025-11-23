import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:green_school/remote/model/login/login_model.dart';
import 'package:green_school/remote/model/login/user_login_model.dart';
import 'package:green_school/remote/response/api_response.dart';
import 'package:green_school/router/screen_name.dart';
import 'package:green_school/ui/controller/auth_view_model.dart';
import 'package:green_school/utils/app_const.dart';
import 'package:shimmer/shimmer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthViewModel viewModel = Get.find<AuthViewModel>();

  final box = GetStorage();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                controller: passwordController,
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
              const SizedBox(height: 25),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Đăng nhập"),
                ),
              ),
              Obx(() {
                return viewModel.loginResponse.value.when(
                  loading: () => Container(),
                  success: (data) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      String title = "";
                      String content = "";
                      if (data.data is LoginDataFailed) {
                        title = (data.data as LoginDataFailed).message;
                        content = data.message.toString();
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
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        box.write(AppConst.USER_TOKEN, data.data.toString());
                        viewModel.loginResponse.value = ApiResponse.loading();
                        enterHome(data);
                      }
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
                    Get.toNamed(ScreenNames.register);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Đăng ký"),
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

  void login() {
    debugPrint("Login Pressed");
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      viewModel.login(
        model: UserLoginModel(
          email: usernameController.text,
          password: passwordController.text,
          remember: true,
        ),
      );
    } else {
      showToast("Email và mật khẩu không được để trống");
    }
  }
}
