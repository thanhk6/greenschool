import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:green_school/remote/model/collection/collection_model.dart';
import 'package:green_school/remote/response/api_response.dart';
import 'package:green_school/ui/controller/auth_view_model.dart';
import 'package:green_school/ui/history/widget/collection_widget.dart';
import 'package:green_school/utils/time_helper.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  AuthViewModel viewModel = Get.find<AuthViewModel>();

  Future<void> _refreshData() async {
    // Simulate a network call or data fetching
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      viewModel.getCollection();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Example data list
    List<Map<String, dynamic>> historyItems = [];
    viewModel.getCollection();
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
                "Lịch sử",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Obx(() {
              return viewModel.collectionResponse.value.when(
                loading: () => Container(),
                success: (data) {
                  List<CollectionItem> items = data.data.items;
                  historyItems = List.generate(items.length, (index) {
                    return {
                      "date": TimeHelper.getTime(items[index].dateAdded),
                      'name': items[index].binCode,
                      'type': items[index].wasteTypeName,
                      'quantity': items[index].quantity,
                      'unit': items[index].unitName,
                      'point': items[index].earnedPoints,
                    };
                  });
                  return CollectionWidget(historyItems: historyItems);
                },
                error: (message) => Container(),
              );
            }),
          ],
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
