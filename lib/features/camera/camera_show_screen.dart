import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moip/features/camera/image_preview_screen.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class CameraShowScreen extends StatefulWidget {
  const CameraShowScreen({super.key});

  @override
  State<CameraShowScreen> createState() => _CameraShowScreenState();
}

class _CameraShowScreenState extends State<CameraShowScreen> {
  bool hasPermission = false;
  late final CameraController _cameraController;

  //권한 요청
  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;
    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) return;

    _cameraController =
        CameraController(cameras[0], ResolutionPreset.ultraHigh);
    await _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initPermissions();
  }

  Future<void> onCaptureTap() async{
    final image = await _cameraController.takePicture();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImagePreviewScreen(image: image, useGallery: false),
      ),
    );
    print("클릭");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: !hasPermission || !_cameraController.value.isInitialized
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Initializing....",
                    style:
                        TextStyle(color: Colors.white, fontSize: Sizes.size20),
                  ),
                  Gaps.v20,
                  CircularProgressIndicator.adaptive(),
                ],
              )
            : Stack(
                children: [
                  CameraPreview(_cameraController),
                  const Positioned(
                    top: Sizes.size40,
                    right: Sizes.size20,
                    child: CloseButton(
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: Sizes.size20,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: onCaptureTap,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: Sizes.size80,
                                height: Sizes.size80,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                              const FaIcon(
                                FontAwesomeIcons.camera,
                                size: Sizes.size44,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
