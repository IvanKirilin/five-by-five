import 'package:five_by_five/multiplication_table_learning_widget.dart';
import 'package:five_by_five/tabel_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MultiplicationTable extends StatefulWidget {
  const MultiplicationTable({super.key, required this.multiplicatorList});

  final List<int> multiplicatorList;

  @override
  State<MultiplicationTable> createState() => _MultiplicationTableState();
}

class _MultiplicationTableState extends State<MultiplicationTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Таблица умножения',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            height: MediaQuery.of(context).size.height / 1.7,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(20),
              itemCount: widget.multiplicatorList.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(children: [
                  TabelBloc(
                    multiplicator: widget.multiplicatorList[index],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 70,
                  )
                ]);
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            child: FloatingActionButton.large(
              backgroundColor: Colors.amber,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MultiplicationTabelLearning(
                              title:
                                  'Проверка ${widget.multiplicatorList.join(', ')}',
                              multiplicatorsList: [...widget.multiplicatorList],
                            )));
              },
              child: Text(
                'Проверка',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 9,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
