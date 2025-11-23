import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_school/remote/response/api_response.dart';
import 'package:green_school/router/screen_name.dart';
import 'package:green_school/ui/controller/auth_view_model.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  String? scannedCode;
  bool isScanned = false;

  AuthViewModel viewModel = Get.find<AuthViewModel>();

  void _onDetect(BarcodeCapture capture) {
    final Barcode? barcode = capture.barcodes.first;
    final String? code = barcode?.rawValue;

    if (code != null && !isScanned) {
      setState(() {
        scannedCode = code;
        isScanned = true;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Scanned: $code')));
      if (isScanned) {
        viewModel.getBinData(binId: code);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR Code'), centerTitle: true),
      body: Stack(
        alignment: Alignment.center,
        children: [
          MobileScanner(onDetect: _onDetect),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(16),
            ),
            width: 250,
            height: 250,
          ),
          Obx(() {
            return viewModel.binResponse.value.when(
              loading: () => Container(),
              success: (data) {
                debugPrint("API BIN MODEL : ${data.data.resultObj.userAppId}");
                int userAppId = data.data.resultObj.userAppId;
                String username = data.data.resultObj.username.toString();
                int binId = data.data.resultObj.binId;
                String qrCode = data.data.resultObj.qrCode.toString();
                String locationName = data.data.resultObj.locationName
                    .toString();
                String address = data.data.resultObj.address.toString();
                String wasteTypeName = data.data.resultObj.wasteTypeName
                    .toString();
                String unitName = data.data.resultObj.unitName.toString();
                viewModel.binResponse.value = ApiResponse.loading();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Get.offNamed(
                    ScreenNames.event,
                    arguments: [
                      userAppId,
                      username,
                      binId,
                      qrCode,
                      locationName,
                      address,
                      wasteTypeName,
                      unitName,
                    ],
                  );
                });
                return Container();
              },
              error: (message) {
                return Container();
              },
            );
          }),
          if (scannedCode != null)
            Positioned(
              bottom: 40,
              child: Text(
                'Result: $scannedCode',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  backgroundColor: Colors.black54,
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isScanned = false;
            scannedCode = null;
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
