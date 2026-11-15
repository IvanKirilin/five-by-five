import 'package:five_by_five/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MultiplicationSwitch extends StatefulWidget {
  const MultiplicationSwitch(
      {super.key, required this.multiplicatorOfTextbutton});
  final int multiplicatorOfTextbutton;

  @override
  State<MultiplicationSwitch> createState() => _MultiplicationSwitchState();
}

class _MultiplicationSwitchState extends State<MultiplicationSwitch> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    final multiplicatorModel = context.watch<MultiplicatorModel>();
    return CupertinoSwitch(
      value: switchValue,
      activeTrackColor: CupertinoColors.activeOrange,
      onChanged: (bool? value) {
        setState(() {
          switchValue = value ?? true;
          if (switchValue) {
            multiplicatorModel
                .getModelElement(widget.multiplicatorOfTextbutton);
          }
          if (!switchValue) {
            multiplicatorModel
                .removeModelElemtnt(widget.multiplicatorOfTextbutton);
          }
        });
      },
    );
  }
}
