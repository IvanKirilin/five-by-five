import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabelBloc extends StatelessWidget {
  const TabelBloc({super.key, required this.multiplicator});
  final int multiplicator;

  @override
  Widget build(BuildContext context) {
    const double hSize = 2;
    const double wSize = 1.8;
    const double fSize = 48 / hSize;
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / wSize,
          height: MediaQuery.of(context).size.height / hSize,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$multiplicator x 1 = ${multiplicator * 1}',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: fSize,
                  ),
                ),
                Text(
                  '$multiplicator x 2 = ${multiplicator * 2}',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: fSize,
                  ),
                ),
                Text(
                  '$multiplicator x 3 = ${multiplicator * 3}',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: fSize,
                  ),
                ),
                Text(
                  '$multiplicator x 4 = ${multiplicator * 4}',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: fSize,
                  ),
                ),
                Text(
                  '$multiplicator x 5 = ${multiplicator * 5}',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: fSize,
                  ),
                ),
                Text(
                  '$multiplicator x 6 = ${multiplicator * 6}',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: fSize,
                  ),
                ),
                Text(
                  '$multiplicator x 7 = ${multiplicator * 7}',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: fSize,
                  ),
                ),
                Text(
                  '$multiplicator x 8 = ${multiplicator * 8}',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: fSize,
                  ),
                ),
                Text(
                  '$multiplicator x 9 = ${multiplicator * 9}',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: fSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 80,
        )
      ],
    );
  }
}
