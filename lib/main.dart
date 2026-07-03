import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  // 스플래시 화면 제어를 위한 초기화
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 마크 숨기기
      home: MyHomeScreen(), // 앱이 켜지면 MyHomeScreen을 가장 먼저 띄웁니다.
    );
  }
}

// 💡 여기서부터 MyHomeScreen의 올바른 구조입니다.
class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  void initState() {
    super.initState();
    _initialization();
  }

  void _initialization() async {
    // 2초 동안 로딩하는 척 대기 (마켓컬리처럼!)
    await Future.delayed(const Duration(seconds: 300));
    
    // 로딩이 끝나면 스플래시 화면을 부드럽게 걷어냅니다.
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF2B4C7E), // 원하셨던 네이비 블루 배경색
      body: Center(
        child: Text(
          '로딩 완료! 메인 화면입니다.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
