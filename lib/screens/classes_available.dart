// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../components/button.dart';
import '../components/card_absences.dart';
import '../components/card_take_classes.dart';
import '../components/custom_select.dart';
import '../components/input_date.dart';
import '../components/input_file.dart';
import '../components/input_text_area.dart';

class ClassesAvailableScreen extends StatefulWidget {
  final bool useWhiteAppBar;

  const ClassesAvailableScreen({Key? key, this.useWhiteAppBar = false})
      : super(key: key);

  @override
  _ClassesAvailableScreenState createState() => _ClassesAvailableScreenState();
}

class _ClassesAvailableScreenState extends State<ClassesAvailableScreen> {
  int selectedSegment = 0; // Index of the selected segment

  @override
  Widget build(BuildContext context) {
    double appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 0.0),
              child: Text.rich(
                TextSpan(
                  text: 'Assumir aulas disponíveis',
                  style: TextStyle(
                    color: Color(0xFF686565),
                    fontSize: 21,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 0.42,
                  ),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: widget.useWhiteAppBar ? Colors.white : null,
        iconTheme: IconThemeData(color: Color(0xFF686565)),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - appBarHeight,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the entire column
              children: [
                Text(
                  'Aulas disponíveis',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 0.46,
                  ),
                ),
                SizedBox(height: 26),
                Align(
                  alignment: Alignment.center,
                  child: CupertinoSegmentedControl(
                    children: {
                      0: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Aulas disponíveis'),
                        ),
                      ),
                      1: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Aulas assumidas'),
                        ),
                      ),
                    },
                    groupValue: selectedSegment,
                    onValueChanged: (value) {
                      setState(() {
                        selectedSegment = value as int;
                      });
                    },
                  ),
                ),
                SizedBox(height: 26),
                Visibility(
                  visible: selectedSegment == 0,
                  child: Column(
                    children: [
                      Text(
                        'Total: 3 Aulas disponíveis',
                        style: TextStyle(
                          color: Color.fromARGB(255, 124, 123, 123),
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: 16),
                      Column(
                        children: [
                          CardTakeClass(
                            title: 'Nome da disciplina (turma - turno)',
                            row1Value: '12/10/2023',
                            row2Value: 'Deferido',
                          ),
                          CardTakeClass(
                            title: 'Nome da disciplina (turma - turno)',
                            row1Value: '12/10/2023',
                            row2Value: 'Deferido',
                          ),
                          SizedBox(height: 60),
                        ],
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: selectedSegment == 1,
                  child: Column(
                    children: [
                      Text(
                        'Total: 2 Aulas assumidas',
                        style: TextStyle(
                          color: Color.fromARGB(255, 124, 123, 123),
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(height: 240),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
