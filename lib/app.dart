//src 폴더를 생성해서 그 안에 넣을 것 

import 'package:flutter/material.dart';

class App extends StatelessWidget {
	const App({super.key});
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Center(
				child: Image.asset('asstes/images/logo_simbol.png'),   //로고 사진 파일명 바꿀 필요 있음
			),
		);
	}
}
