import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_school/main.dart';
import 'package:green_school/remote/response/api_response.dart';
import 'package:green_school/router/screen_name.dart';
import 'package:green_school/ui/controller/auth_view_model.dart';
import 'package:green_school/ui/home/widget/home_header.dart';
import 'package:green_school/ui/home/widget/home_list.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with RouteAware {
  AuthViewModel viewModel = Get.find<AuthViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getInfo();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    viewModel.getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: Column(
        children: [
          Obx(() {
            return viewModel.infoResponse.value.when(
              loading: () => Container(),
              success: (data) {
                return HomeHeader(
                  name: data.data.resultObj.fullName,
                  giftScore: data.data.resultObj.totalPoints,
                  onQrClicked: () {
                    Get.toNamed(ScreenNames.qrscanner);
                  },
                );
              },
              error: (message) => Container(),
            );
          }),
          // HomeHeader(
          //   name: '',
          //   giftScore: '',
          //   onQrClicked: () {
          //     Get.toNamed(ScreenNames.qrscanner);
          //   },
          // ),
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(5, 32, 5, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // BannerSlider(),
                    SizedBox(
                      width: double.infinity,
                      height: 500,
                      child: HomeList(
                        onItemClicked: (url) {
                          _openWebView(url);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openWebView(String url) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (_, controller) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const Divider(height: 1),
                  Expanded(
                    child: WebViewWidget(
                      gestureRecognizers:
                          <Factory<OneSequenceGestureRecognizer>>{
                            Factory<VerticalDragGestureRecognizer>(
                              () => VerticalDragGestureRecognizer(),
                            ),
                            Factory<EagerGestureRecognizer>(
                              () => EagerGestureRecognizer(),
                            ),
                          },
                      controller: WebViewController()
                        ..setJavaScriptMode(JavaScriptMode.unrestricted)
                        ..loadRequest(Uri.parse(url)),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
