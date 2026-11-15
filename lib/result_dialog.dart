import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class ResultDialog extends StatelessWidget {
  final double sessionTime;
  final List<int> lessonName;
  final double answerTime;
  final int successful;
  final int errors;
  final double successRate;
  final int scores;
  const ResultDialog(this.lessonName, this.sessionTime, this.answerTime,
      this.successful, this.errors, this.successRate, this.scores,
      {super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formatedDate = DateFormat('dd.MM.yyyy (kk:mm)').format(now);
    Map massage = {
      'РЕЗУЛЬТАТ УРОКА ': formatedDate,
      'Умножение и деление на ': lessonName,
      'Время урока (секунд) ': sessionTime.toStringAsFixed(1),
      'Среднее время на ответ (секунд) ': answerTime.toStringAsFixed(1),
      'Правильных ответов ': successful,
      'Ошибок ': errors,
      'Проценкт правильных ответов (%) ': successRate.toStringAsFixed(1),
      'Заработано баллов ': scores
    };
    return AlertDialog(
      title: const Text('РЕЗУЛЬТАТ УРОКА'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Дата и время урока: $formatedDate'),
          const SizedBox(
            height: 5,
          ),
          Text('Умножение и деление на: $lessonName'),
          const SizedBox(
            height: 5,
          ),
          Text('Время сессии: ${sessionTime.toStringAsFixed(1)} секунд'),
          const SizedBox(
            height: 5,
          ),
          Text(
              'Среднее время на ответ: ${answerTime.toStringAsFixed(1)} секунд'),
          const SizedBox(
            height: 5,
          ),
          Text('Правильных ответов: $successful'),
          const SizedBox(
            height: 5,
          ),
          Text('Ошибок: $errors'),
          const SizedBox(
            height: 5,
          ),
          Text('Правильных ответов ${successRate.toStringAsFixed(1)}%'),
          const SizedBox(
            height: 5,
          ),
          Text('Заработано баллов: $scores'),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () async {
                await SharePlus.instance.share(ShareParams(text: massage.toString()));
              },
              child: Text('Отправить',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Назад',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
