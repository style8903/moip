import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moip/constants/text_style.dart';
import 'package:moip/features/camera/camera_show_screen.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import 'image_preview_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  //카메라 촬영 메서드
  void onCameraShow() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CameraShowScreen(),
        ));
  }

  //갤러리 불러오기 메서드
  Future<void> onGalleryTap() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImagePreviewScreen(image: image, useGallery: true),
      ),
    );
  }

  //옷장에서 선택 메서드
  void onClosetTap(){

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(Sizes.size60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onCameraShow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.camera,
                      color: Theme.of(context).colorScheme.secondary,
                      size: Sizes.size44,
                    ),
                    Gaps.h32,
                    Text(
                      "카메라로 자동 인식",
                      style: myTextStyle.bodyLarge,
                    ),
                  ],
                ),
              ),
              Gaps.v52,
              GestureDetector(
                onTap: onGalleryTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.image,
                      color: Theme.of(context).colorScheme.secondary,
                      size: Sizes.size44,
                    ),
                    Gaps.h32,
                    Text(
                      "갤러리에서 사진 가져오기",
                      style: myTextStyle.bodyLarge,
                    ),
                  ],
                ),
              ),
              Gaps.v52,
              GestureDetector(
                onTap: onClosetTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.shirt,
                      color: Theme.of(context).colorScheme.secondary,
                      size: Sizes.size44,
                    ),
                    Gaps.h32,
                    Text(
                      "옷장 사진 가져오기",
                      style: myTextStyle.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
