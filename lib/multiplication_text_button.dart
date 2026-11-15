import 'package:five_by_five/switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'multiplication_table_learning_widget.dart';

class MultiplicationTextButton extends StatelessWidget {
  const MultiplicationTextButton({
    required this.multiplicator,
    super.key,
  });
  final int multiplicator;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MultiplicationTabelLearning(
                          title: 'Умножение на $multiplicator',
                          multiplicatorsList: [multiplicator],
                        )),
              );
            },
            child: Text(
              'Умножение на $multiplicator',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            )),
        const SizedBox(
          width: 20,
        ),
        MultiplicationSwitch(
          multiplicatorOfTextbutton: multiplicator,
        ),
      ],
    );
  }
}
