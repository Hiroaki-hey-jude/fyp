import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/firebase_options.dart';
import 'package:fyp/screen/home_screen.dart';
import 'package:fyp/screen/login_screen.dart';
import 'package:fyp/shared/constant.dart';
import 'package:fyp/sharedpreference/sharedpreference.dart';
import 'package:purchases_flutter/object_wrappers.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

final _configuration =
    PurchasesConfiguration('appl_yyFOvBWwVQOgIeYOeUlHbJpMbOn');
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Purchases.configure(_configuration);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  /// ログインステータス取得
  getUserLoggedInStatus() async {
    await SharedPreferencesData().getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Constant().primaryColor,
      ),
      home: _isSignedIn ? HomeScreen() : LoginScreen(),
      // home: Scaffold(
      //   // body: LoginScreen(),
      //   body: _isSignedIn ? const CropScreen() : LoginScreen(),
      // ),
    );
  }
}
