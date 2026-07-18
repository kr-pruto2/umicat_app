// src/app.dart  

import 'package:umicat_app/main.dart';
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
				child: text{
					'초기 소개 페이지',
					style: TextStyle(color: Colors.white),
				),
			),
		);
	}
}