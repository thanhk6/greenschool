import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:green_school/remote/model/redemption_history/r_history.dart';
import 'package:green_school/remote/response/api_response.dart';
import 'package:green_school/ui/controller/auth_view_model.dart';
import 'package:green_school/ui/reward/widget/reward_history_item.dart';
import 'package:green_school/utils/time_helper.dart';

class RewardHistory extends StatefulWidget {
  const RewardHistory({super.key});

  @override
  State<StatefulWidget> createState() => _RewardHistoryState();
}

class _RewardHistoryState extends State<RewardHistory> {
  AuthViewModel viewModel = Get.find<AuthViewModel>();

  Future<void> _refreshData() async {
    // Simulate a network call or data fetching
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
     viewModel.getRewardHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Example data list
    List<Map<String, dynamic>> historyItems = [];
    viewModel.getRewardHistory();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData, 
        child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(10, 60, 10, 20),
            alignment: Alignment.center,
            child: Text(
              "Lịch sử đổi quà",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Obx(() {
            return viewModel.rewardHistoryResponse.value.when(
              loading: () => Container(),
              success: (data) {
                List<RedemptionHistoryItem> items = data.resultObj.items;
                historyItems = List.generate(items.length, (index) {
                  return {
                    "date": TimeHelper.getTime(items[index].dateAdded),
                    'rewardName': items[index].userName,
                    'totalPointsSpent': items[index].totalPointsSpent,
                    'quantity': items[index].quantity,
                  };
                });
                return RewardHistoryItem(historyItems: historyItems);
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
      ))
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
}

