// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../components/button.dart';
import '../components/custom_select.dart';
import '../components/input_date.dart';

class MyAbsencesScreen extends StatefulWidget {
  final bool useWhiteAppBar;

  const MyAbsencesScreen({Key? key, this.useWhiteAppBar = false})
      : super(key: key);

  @override
  _MyAbsencesScreenState createState() => _MyAbsencesScreenState();
}

class _MyAbsencesScreenState extends State<MyAbsencesScreen> {
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
                  text: 'Meus afastamentos',
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
                  'Afastamentos',
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
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Solicitar afastamento'),
                        ),
                      ),
                      1: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Visualizar'),
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
                        'Solicite um afastamento das aulas',
                        style: const TextStyle(
                          color: Color(0xFF4C525A),
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: 16),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: DateInputCard(
                                    title: 'De:', type: 'initial'),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                flex: 3,
                                child:
                                    DateInputCard(title: 'A:', type: 'final'),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 8.0),
                              child: Text(
                                "Selecione um motivo:",
                                style: const TextStyle(
                                  color: Color(0xFF4C525A),
                                  fontSize: 17,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          CustomSelect(
                            items: ['Viagem', 'Doença', 'Evento'],
                            onChanged: (value) {
                              // Lógica a ser executada quando um item for selecionado
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: selectedSegment == 1,
                  child: Column(
                    children: [
                      Text('Visualize seus afastamentos'),
                      SizedBox(height: 16),
                      Button(
                        label: '2',
                        width: 100,
                        onPressed: () {
                          // Lógica a ser executada quando o botão for pressionado
                        },
                      )
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
