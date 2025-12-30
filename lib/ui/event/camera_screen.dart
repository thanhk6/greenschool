import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isTakingPicture = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();

    // Use back camera + LOW resolution
    _controller = CameraController(
      _cameras!.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
      ),
      ResolutionPreset.low, // 👈 LOW resolution
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    await _controller!.initialize();
    if (mounted) setState(() {});
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) return;
    if (_isTakingPicture) return;

    setState(() => _isTakingPicture = true);

    try {
      final XFile file = await _controller!.takePicture();

      final bytes = await File(file.path).readAsBytes();

      // Convert to Base64
      final String base64Image = base64Encode(bytes);

      debugPrint('Base64 Image Length: ${base64Image.length}');
      debugPrint('Base64 Image (short): ${base64Image.substring(0, 100)}...');

      // 👉 You can now send base64Image to API
      // Navigator.pop(context, base64Image);
      _sendBase64ToPreviousScreen(base64Image);
    } catch (e) {
      debugPrint('Error taking picture: $e');
    } finally {
      setState(() => _isTakingPicture = false);
    }
  }

  void _sendBase64ToPreviousScreen(String base64Image) {
    Navigator.pop(context, base64Image);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Camera')),
      body: Stack(
        children: [
          CameraPreview(_controller!),
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                onPressed: _isTakingPicture ? null : _takePicture,
                child: const Icon(Icons.camera_alt, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
