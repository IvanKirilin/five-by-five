import 'package:flutter/material.dart';

class NumberButtonWidget extends StatelessWidget {
  final int number;
  const NumberButtonWidget(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {}, child: Text(number.toString()));
  }
}
