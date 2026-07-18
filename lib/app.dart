// src/app.dart  

import 'package:umicat_app/main.dart';
import 'package:umicat_app/src/init/page/init_start_page.dart';
import 'package:umicat_app/src/splash/page/splash_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
	const App({super.key});
	
	@override
	state<app> createState() => _Appstate();
}
class _Appstate extends State<App>{
	late bool isInitStarted;
	
	@override
	void initState() {
		super.initState();
		isInitStarted = prefs.getBool('isInitStarted') ?? true;
	}
	@override
	Widget build(BuildContext context) {
		return isInitStarted ? const InitStartPage() : const SplashPage();
	}
}


// src/init/page/init_start_page.dart

import 'package:flutter/material.dart';

class InitStartPage extends StatelesWidget {
	const InitStartPage({super.key});
	
	@override
	Widget build(BuildContext context) {
		return const Scaffold(
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						SizedBox(
							width: 99,
							height: 116,
							child: Image.asset(
								'asset/images/logo.png',   //로고 파일명 변경할 필요 있음
							),
						),
						Text(
							'당신의 최애 밴드를 발견하고 그들의 일상에 공감해보세요!',
							style: GoogleFonts.notoSans(
								fontWeight: FontWeight.bold,
								fontSize: 20,
								color: Colors.white,
							),
						),
						Text
					],
				),
			),
		);
	}
}

// src/splash/page/splash_page.dart

import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
	const SplashPage({super.key});

	@override
	Widget build(BuildContext context) {
		return const Scaffold(
			body: Center(
				child: Text(
					'splash 페이지',
					style: TextStyle(color: Colors.white),
				),
			),
		);
	}
}