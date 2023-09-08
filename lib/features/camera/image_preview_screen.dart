import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:moip/constants/gaps.dart';

class ImagePreviewScreen extends StatefulWidget {
  final XFile image;
  final bool useGallery;

  const ImagePreviewScreen({
    super.key,
    required this.image,
    required this.useGallery,
  });

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  bool _saveImage = false;

  @override
  void initState() {
    super.initState();
    if (widget.useGallery) {
      _saveImage = true;
    }
    setState(() {});
  }

  //갤러리 저장
  Future<void> _saveImageToGallery() async {
    //이미 저장한 경우 저장하지 않음
    if (_saveImage) return;

    await GallerySaver.saveImage(widget.image.path, albumName: "Moip");
    _saveImage = true;
    setState(() {});
  }

  //옷장에 저장(DB에 업로드)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview Image"),
        actions: [
          IconButton(
            onPressed: _saveImageToGallery,
            icon: FaIcon(_saveImage
                ? FontAwesomeIcons.check
                : FontAwesomeIcons.download),
          ),
        ],
      ),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gaps.v32,
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Image.file(
                File(widget.image.path),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
