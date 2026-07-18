class MyApp extends StatelessWidget{
	const MyApp({super.key});
	@override
	Widget build(BuildContext context){
		return GetMaterialApp(
			title: '우미캣 코딩',
			initialRoute: '/',
			theme: ThemeDate(
				appBarTheme: const AppBarTheme(
					elevation: 0,
					color: Color(0xff212123),
					titleTextStyle: TextStyle(
						color: Color.white,
					),
				),
				scaffoldBackgroundColor: const Color(0xff212123),
			),
			getPages: [],
				GetPage(name: '/', page: () => const App()),
			],
		);
	}
}