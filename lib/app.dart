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
		return isInitStarted 
			? const InitStartPage(
			onStart: () {
				setState(() {
					isInitStarted = false;
				});
				prefs.setBool('isInitStarted', isInitStarted);
			},
		) : const SplashPage();
	}
}


// src/init/page/init_start_page.dart

import 'package:flutter/material.dart';

class InitStartPage extends StatelesWidget {
	const InitStartPage({super.key});
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
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
						const SizeBox(height: 40),
						const AppFont(
							'Minor Notes, Major Impact',
							fontWeight: FontWeight.bold,
							size: 20,
							),
						),
						const SizeBox(height: 15),
						const AppFont(
							'당신의 최애 밴드를 발견하고 그들의 일상에 공감해보세요!',
							align: TextAlign.center,
							size: 18,
							color: Colors.white.withOpacity(0.6),
						)
					],
				),
			),
			bottomNavigationBar: Padding(
				padding: EdgeInsets.only(
					left: 25, right: 25, bottom: 25 + Get.mediaQuery.padding.bottom),
				child: Btn(
					onTap: onStart,
					child: const AppFont(
						'시작하기',
						align: TextAlign.center,
						size: 18,
						fontWeight: FontWeight.bold,
					),
				),
			),
		);
	}
}

// src/common/components/btn.dart
import 'package:umicat_app/src/common/components/app_font.dart';
import 'package:flutter/material.dart';

class Btn exends StatelesWidget {
	final Widget child;
	final Function() onTap;
	const Btn(){
		super.key,
		required this.child,
		required this.onTap,
	});

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: () {],
			child: ClipRRect(
				borderRadius: BorderRadius.circular(7),
				child: Container(
					padding: const EdgeInsets.symmetric(vertical: 15),
					color: const Color(0xffED7738),
					child: child,	
				),
			),
		);
	}
}

// src/common/components/app_fonts.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appfonts extends StatelessWidget {
	final String text;
	final Color? color;
	final double? size;
	final TextAlign? align;
	final FontWeight? fontWeight;
	const AppFont(
		this.text, {
		super.key,
		this.color = Colors.white,
		this.align,
		this.size,
		this.fontWeight,
	});

	@override
	Widget build(BuildContext context) {
		return Text(
			text,
			textAlign: align,
			style: GoogleFonts.notoSans(
				color: color,
				fontSize: size,
				fontWeight: fontWeight,
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

// src/splash/controller/splash_controller.dart

class SplashController extends GetxController {
	Rx<StepType> loadStep = StepType.dataLoad.obs;
	
	changeStep(StepType type) {
		loadStep(type);
	}
}

// src/splash/enum/step_type.dart

enum StepType {
	dataLoad('데이터 로드'),
	authCheck('인증 체크');

	const StepType(this.name);
	final String name;
}

