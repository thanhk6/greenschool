import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:green_school/remote/model/redemption/redemption_model.dart';
import 'package:green_school/remote/model/reward/reward_model.dart';
import 'package:green_school/remote/response/api_response.dart';
import 'package:green_school/ui/controller/auth_view_model.dart';
import 'package:green_school/ui/reward/widget/reward_item_widget.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  AuthViewModel viewModel = Get.find<AuthViewModel>();

  Future<void> _refreshData() async {
    // Simulate a network call or data fetching
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      viewModel.getRewards();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Example data list
    List<Map<String, dynamic>> rewardItems = [];
    viewModel.getRewards();
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: _refreshData,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Danh sách quà",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // To center title
                ],
              ),
              Obx(() {
                return viewModel.rewardsResponse.value.when(
                  loading: () => Container(),
                  success: (data) {
                    List<RewardItem> items = data.data.items;
                    rewardItems = List.generate(items.length, (index) {
                      return {
                        "id": items[index].id,
                        'name': items[index].name,
                        'description': items[index].description,
                        'pointCost': items[index].pointCost,
                        'stock': items[index].stock,
                      };
                    });
                    return RewardItemWidget(
                      rewardItems: rewardItems,
                      onRedeem: (int id) {
                        viewModel.postRedemption(id);
                      },
                    );
                  },
                  error: (message) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showToast(message);
                    });
                    return Container();
                  },
                );
              }),
              Obx(() {
                return viewModel.redemptionResponse.value.when(
                  loading: () => Container(),
                  success: (data) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      debugPrint(
                        'DOI QUA ${(data.data as RedemptionData).rewardName}',
                      );
                      if (data.data is RedemptionData) {
                        String content =
                            (data.data as RedemptionData).rewardName;
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Đổi điểm thành công!'),
                              content: Text(content),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
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
                      }
                      viewModel.redemptionResponse.value = ApiResponse.loading();
                    });
                    return Container();
                  },
                  error: (message) => Container(),
                );
              }),
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
}
