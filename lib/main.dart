import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/app.dart';
import 'src/splash/controller/data_load_controller.dart';
import 'src/splash/controller/splash_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp();

  Get.put<SharedPreferences>(prefs, permanent: true);
  Get.put<FirebaseAuth>(FirebaseAuth.instance, permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '우미캣 코딩',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xff212123),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: const Color(0xff212123),
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(SplashController());
        Get.put(DataLoadController());
      }),
      home: const App(),
    );
  }
}
