import 'dart:math';
// ignore: unused_import
import 'package:five_by_five/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:five_by_five/result_dialog.dart';

class MultiplicationTabelLearning extends StatefulWidget {
  const MultiplicationTabelLearning({
    super.key,
    required this.title,
    required this.multiplicatorsList,
  });

  final String title;
  final List<int> multiplicatorsList;

  @override
  State<MultiplicationTabelLearning> createState() =>
      _MultiplicationTabelLearningState();
}

class _MultiplicationTabelLearningState
    extends State<MultiplicationTabelLearning> {
  final random = Random();
  final stopwatch = Stopwatch();
  final stopwatchTasks = Stopwatch();

  //App data
  String massage = '';
  late int a;
  late int b;
  late num c;
  String buttonText = 'Старт';
  String task = '';
  dynamic answer;
  late List<Widget> interface = [];

  //Report data
  int score = 0;
  double sessionTime = 0;
  List<int> answerTimeList = [];
  double answerTime = 0;
  int successful = 0;
  int errors = 0;
  double successRate = 0;

  void ressetReportDataToZero() {
    successful = 0;
    errors = 0;
    successRate = 0;
    score = 0;
  }

  void buildAnswerTimeList() {
    stopwatchTasks.stop();
    answerTimeList.add((stopwatchTasks.elapsedMilliseconds));
    stopwatchTasks.reset();
    stopwatchTasks.start();
  }

  void _getTask() {
    massage = '';
    bool isTaskMultiply = random.nextBool();
    if (isTaskMultiply) {
      if (task == '') {
        ressetReportDataToZero();
        a =
            widget.multiplicatorsList[random.nextInt(
              widget.multiplicatorsList.length,
            )];
        b = random.nextInt(10);
        task = '$a x $b';
        c = a * b;
        buttonText = '';
        stopwatch.start();
        stopwatchTasks.start();
      } else {
        answer = int.parse(buttonText);
        if (answer == c) {
          successful++;
          score++;
          a =
              widget.multiplicatorsList[random.nextInt(
                widget.multiplicatorsList.length,
              )];
          b = random.nextInt(10);
          task = '$a x $b';
          c = a * b;
          buttonText = '';
          buildAnswerTimeList();
        } else {
          errors++;
          score = 0;
          massage =
              'Ошибка! $task = ${c.toString().replaceAll(RegExp(r'.0'), '')}';
          FlutterRingtonePlayer().playNotification();
          a =
              widget.multiplicatorsList[random.nextInt(
                widget.multiplicatorsList.length,
              )];
          b = random.nextInt(10);
          task = '$a x $b';
          c = a * b;
          buttonText = '';
          buildAnswerTimeList();
        }
      }
    } else {
      if (task == '') {
        ressetReportDataToZero();
        var x = random.nextInt(10);
        var y =
            widget.multiplicatorsList[random.nextInt(
              widget.multiplicatorsList.length,
            )];
        var z = x * y;
        task = '$z / $y';
        c = z / y;
        buttonText = '';
        stopwatch.start();
        stopwatchTasks.start();
      } else {
        answer = int.parse(buttonText);
        if (answer == c) {
          successful++;
          score++;
          var x = random.nextInt(10);
          var y =
              widget.multiplicatorsList[random.nextInt(
                widget.multiplicatorsList.length,
              )];
          var z = x * y;
          task = '$z / $y';
          c = z / y;
          buttonText = '';
          buildAnswerTimeList();
        } else {
          errors++;
          score = 0;
          massage =
              'Ошибка! $task = ${c.toString().replaceAll(RegExp(r'.0'), '')}';
          FlutterRingtonePlayer().playNotification();
          var x = random.nextInt(10);
          var y =
              widget.multiplicatorsList[random.nextInt(
                widget.multiplicatorsList.length,
              )];
          var z = x * y;
          task = '$z / $y';
          c = z / y;
          buttonText = '';
          buildAnswerTimeList();
        }
      }
    }
    setState(() {});
  }

  void stop() {
    stopwatch.stop();
    stopwatchTasks.stop();
    sessionTime = (stopwatch.elapsedMilliseconds) / 1000;
    answerTime = (answerTimeList.average) / 1000;
    if (successful != 0) {
      successRate = (successful / (errors + successful)) * 100;
    } else {
      successRate = 0;
    }
    showDialog<Dialog>(
      context: context,
      builder: (context) => ResultDialog(
        widget.multiplicatorsList,
        sessionTime,
        answerTime,
        successful,
        errors,
        successRate,
        score,
      ),
    );
    a = 0;
    b = 0;
    c = 0;
    answer = 0;
    task = '';
    massage = '';
    buttonText = 'Старт';
    stopwatch.reset();
    stopwatchTasks.reset();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height / 80),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
              child: Text(
                massage,
                style: GoogleFonts.nunito(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 80),
            if (buttonText != 'Старт')
              Text(
                'У Вас ${score.toString()} баллов',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            SizedBox(height: MediaQuery.of(context).size.height / 80),
            Text(
              task,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 80),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.large(
                    heroTag: "btn1",
                    onPressed: () {
                      stop();
                    },
                    backgroundColor: Colors.amber,
                    child: Text(
                      'Стоп',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  FloatingActionButton.large(
                    heroTag: "btn2",
                    onPressed: _getTask,
                    child: Text(
                      buttonText,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.height / 80),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      heroTag: "btn3",
                      onPressed: () {
                        buttonText += '1';
                        setState(() {});
                      },
                      child: Text(
                        '1',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      heroTag: "btn4",
                      onPressed: () {
                        buttonText += '2';
                        setState(() {});
                      },
                      child: Text(
                        '2',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      heroTag: "btn5",
                      onPressed: () {
                        buttonText += '3';
                        setState(() {});
                      },
                      child: Text(
                        '3',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      heroTag: "btn6",
                      onPressed: () {
                        buttonText += '4';
                        setState(() {});
                      },
                      child: Text(
                        '4',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      heroTag: "btn7",
                      onPressed: () {
                        buttonText += '5';
                        setState(() {});
                      },
                      child: Text(
                        '5',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      heroTag: "btn8",
                      onPressed: () {
                        buttonText += '6';
                        setState(() {});
                      },
                      child: Text(
                        '6',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      heroTag: "btn9",
                      onPressed: () {
                        buttonText += '7';
                        setState(() {});
                      },
                      child: Text(
                        '7',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      heroTag: "btn10",
                      onPressed: () {
                        buttonText += '8';
                        setState(() {});
                      },
                      child: Text(
                        '8',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      heroTag: "btn11",
                      onPressed: () {
                        buttonText += '9';
                        setState(() {});
                      },
                      child: Text(
                        '9',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                FloatingActionButton(
                  heroTag: "btn12",
                  onPressed: () {
                    buttonText += '0';
                    setState(() {});
                  },
                  child: Text(
                    '0',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
