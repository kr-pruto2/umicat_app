import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxListener<T> extends StatelessWidget {
  final Rx<T> stream;
  final Widget child;
  final void Function(T value) listen;
  final void Function()? initCall;

  const GetxListener({
    super.key,
    this.initCall,
    required this.stream,
    required this.listen,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (initCall != null) {
      initCall!();
    }

    return Obx(() {
      final value = stream.value;
      listen(value);
      return child;
    });
  }
}
