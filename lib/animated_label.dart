import 'package:five_by_five/multiplication_table.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'multiplication_text_button.dart';

class AnimatedLabel extends StatefulWidget {
  const AnimatedLabel({
    super.key,
  });

  @override
  State<AnimatedLabel> createState() => _AnimatedLabelState();
}

class _AnimatedLabelState extends State<AnimatedLabel> {
  final double width = 350;
  late double height = 70;
  var animatedLabelContent = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Consumer<MultiplicatorModel>(
        builder: (context, multiplicatorModel, child) {
      late List<int> listOfMultiplicators =
          multiplicatorModel.modelElementsList;
      listOfMultiplicators.sort();
      return AnimatedContainer(
        duration: const Duration(milliseconds: 0),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: Colors.blue),
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            TextButton(
              child: Text(
                'Математика',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (height == 70) {
                    height = MediaQuery.of(context).size.height / 1.25;
                    for (var i = 2; i < 10; i++) {
                      animatedLabelContent
                          .add(MultiplicationTextButton(multiplicator: i));
                    }
                    animatedLabelContent.add(const SizedBox(
                      height: 20,
                    ));
                    animatedLabelContent.add(
                      Row(
                        children: [
                          const SizedBox(
                            width: 100,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 8,
                            child: FloatingActionButton.large(
                              backgroundColor: Colors.amber,
                              child: Text(
                                'Учить',
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MultiplicationTable(
                                                multiplicatorList:
                                                    listOfMultiplicators)));
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    height = 70;
                    animatedLabelContent.clear();
                    multiplicatorModel.clearModelElements();
                  }
                });
              },
            ),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Wrap(
                direction: Axis.vertical,
                spacing: -5,
                children: animatedLabelContent,
              ),
            ])
          ],
        ),
      );
    });
  }
}
