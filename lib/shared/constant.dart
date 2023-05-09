import 'package:flutter/material.dart';

class Constant {
  static const blackColor = Color.fromRGBO(1, 1, 1, 1);
  static const whiteColor = Colors.white;
  // static const primaryColor = Colors.green;
  final primaryColor = const Color.fromARGB(255, 22, 118, 43);

  // デフォルトユーザ設定
  static const anonymousProfilePic =
      'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif';
  static const blockedUserName = 'ブロックしたユーザ';

  final url = Uri.parse(
      'https://cut-primula-dac.notion.site/27bc1799880d49c7877e6f2f0e348296');

  final appStoreURL =
      Uri.parse('https://apps.apple.com/jp/app/1669222644?mt=8');
}
