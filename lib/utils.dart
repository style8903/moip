import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

void showFirebaseErrorSnack(BuildContext context, Object? error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      //state.error.toString으로 하는 것보다 파이어베이스 에러 형식으로 받으면 코드가 나오지 않고 메세지만 나옴
      content: Text((error as FirebaseException).message ?? "Something wrong"),
    ),
  );
}