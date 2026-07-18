//src 폴더를 생성해서 그 안에 넣을 것 

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
