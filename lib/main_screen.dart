import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'animated_label.dart';
import 'main.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MultiplicatorModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              )),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              const AnimatedLabel(),
            ],
          ),
        ),
      ),
    );
  }
}
