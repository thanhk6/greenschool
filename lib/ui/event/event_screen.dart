import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:green_school/remote/model/event/event_create_model.dart';
import 'package:green_school/remote/response/api_response.dart';
import 'package:green_school/ui/controller/auth_view_model.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<StatefulWidget> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  AuthViewModel viewModel = Get.find<AuthViewModel>();

  final data = Get.arguments;

  static const int USER_APP_ID = 0;
  static const int USERNAME = 1;
  static const int BIN_ID = 2;
  static const int QR_CODE = 3;
  static const int LOCATION_NAME = 4;
  static const int ADDRESS = 5;
  static const int WASTE_TYPE_NAME = 6;
  static const int UNIT_NAME = 7;

  TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.green[400],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Tạo sự kiện',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // giữ cân bằng icon back
                ],
              ),
            ),
            Obx(() {
              return viewModel.eventResponse.value.when(
                loading: () => Container(),
                success: (eventRes) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showToast("Tạo sự kiện đổ rác thành công");
                    Get.back();
                    viewModel.eventResponse.value = ApiResponse.loading();
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
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildInfoItem("Tên người dùng", data[USERNAME]),
                      buildDivider(),
                      buildInfoItem("Mã thùng rác", data[QR_CODE]),
                      buildDivider(),
                      buildInfoItem("Vị trí thùng rác", data[LOCATION_NAME]),
                      buildDivider(),
                      buildInfoItem("Địa chỉ", data[ADDRESS]),
                      buildDivider(),
                      buildInfoItem("Loại rác", data[WASTE_TYPE_NAME]),
                      buildDivider(),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Khối lượng rác",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: quantityController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  Text(
                                    data[UNIT_NAME],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 24,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF607D8B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 14,
                              ),
                            ),
                            onPressed: () {
                              createRequest();
                            },
                            child: Text(
                              "Gửi",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createRequest() {
    debugPrint("Create event request");
    if (quantityController.text.isNotEmpty) {
      viewModel.createEvent(
        model: EventCreateModel(
          userAppId: data[USER_APP_ID],
          binId: data[BIN_ID],
          quantity: int.parse(quantityController.text),
        ),
      );
    } else {
      showToast("Nhập khối lượng/số lượng rác!!");
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
}

Widget buildInfoItem(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 16)),
      ],
    ),
  );
}

Widget buildDivider() => const Divider(height: 1, color: Colors.black54);
