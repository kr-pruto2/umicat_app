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

// src/common/components/getx_listener.dart

import 'package:flutter/material.dart'
import 'package:get/get.dart';

class GetxListener<T> extends StatefulWidget {
	final Rx<T> stream;
	final Widget child;
	final Function(T) listen;
	final Function()? initCall;
	const GetxListener({
		super.key,
		this.initCall,
		required this.stream,
		required this.listen,
		required this.child,
	});

	@override
	State<GetxListener> createState() {
		stream.listen(listen);
		return _GetxListenerState();
	}
}

class _GetxListenerState extends State<GetxListener> {
	@override
	void initState() {
		super.initState();

		if (widget.initCall != null) {
			widget.initCall!();
		}
	}
	@override
	Widget build(BuildContext context) {
		return widget.child;
	}
}

// src/splash/page/splash.dart

import 'package:flutter/material.dart';

class SplashPage extends GetView<SplashController> {
	const SplashPage({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Center(
				child: GetxListener<StepType> {
					initCall: () {
						controller.loadStep(StepType.dataLoad);
					},
					listen: (StepType? value) {
						if (value == null) return;
						switch (value) {
							case StepType.init:
							case StepType.dataLoad:
								Get.find<DataLoadController>().loadData();
								break;
							case StepType.authCheck:
								print('authCheck');
								break;
						}
					},
					stream: controller.loadStep,
					child: Obx(
						() {
							return Text(
								'${controller.loadStep.value.name}중 입니다.',
								style: const TextStyle(color: Colors.white),
							);
						},
					),
				),
			),
			FloatingActionButton: FloatingActionButton(onPressed: () {
				controller.loadStep(StepType.authCheck);
			}),
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

// src/splash/controller/data_load_controller.dart

import package:get/get.dart'

class DataLoadController extends GetxController {
	RxBool isDataload = false.obs;

	void loadData() async {
		await Future.delayed(const Duration(miliseconds: 2000));
		isDataLoad(true);
	}
}

// src/splash/enum/step_type.dart

enum StepType {
	init(''),
	dataLoad('데이터 로드'),
	authCheck('인증 체크');

	const StepType(this.name);
	final String name;
}

