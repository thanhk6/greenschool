import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:green_school/router/dashboard_controller.dart';
import 'package:green_school/ui/account/account_screen.dart';
import 'package:green_school/ui/controller/auth_view_model.dart';
import 'package:green_school/ui/history/history_screen.dart';
import 'package:green_school/ui/home/home_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final DashboardController _controller = Get.put(DashboardController());

  AuthViewModel authViewModel = Get.find<AuthViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: _controller.tabIndex.value,
          children: [HomeScreen(), HistoryScreen(), AccountScreen()],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: _controller.tabIndex.value,
          onTap: _controller.changeTabIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.greenAccent,
          elevation: 25,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.document_scanner),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
