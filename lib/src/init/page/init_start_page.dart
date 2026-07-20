import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umicat_app/src/common/components/app_fonts.dart';
import 'package:umicat_app/src/common/components/btn.dart';

class InitStartPage extends StatelessWidget {
  final VoidCallback onStart;

  const InitStartPage({
    super.key,
    required this.onStart,
  });

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
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(height: 40),
            const Appfonts(
              'Minor Notes, Major Impact',
              fontWeight: FontWeight.bold,
              size: 20,
            ),
            const SizedBox(height: 15),
            const Appfonts(
              '����� �־� ��带 �߰��ϰ� �׵��� �ϻ� �����غ�����!',
              align: TextAlign.center,
              size: 18,
              color: Color(0x99FFFFFF),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 25 + Get.mediaQuery.padding.bottom,
        ),
        child: Btn(
          onTap: onStart,
          child: const Appfonts(
            '�����ϱ�',
            align: TextAlign.center,
            size: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
