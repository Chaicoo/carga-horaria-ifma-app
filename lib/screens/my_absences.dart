// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../components/button.dart';
import '../components/card_absences.dart';
import '../components/input_date.dart';
import '../components/input_file.dart';
import '../components/input_text_area.dart';
import '../components/input_filter.dart';
import '../routes/api_client_get.dart'; // Import the InputFilter component

class MyAbsencesScreen extends StatefulWidget {
  final bool useWhiteAppBar;
  final String token;

  const MyAbsencesScreen({
    Key? key,
    required this.useWhiteAppBar,
    required this.token,
  }) : super(key: key);

  @override
  _MyAbsencesScreenState createState() => _MyAbsencesScreenState();
}

class _MyAbsencesScreenState extends State<MyAbsencesScreen> {
  int selectedSegment = 0;
  late List<dynamic> responseData;

  @override
  void initState() {
    super.initState();

    if (selectedSegment == 1) {
      _fetchData();
    }
  }

  Future<void> _fetchData() async {
    try {
      final apiClient = ApiClient(token: widget.token);
      final dynamic result = await apiClient
          .getData('/api/cargahoraria/professor-logado/afastamentos');

      setState(() {
        responseData = result;
      });

      print(responseData);
    } catch (e) {
      print('Erro ao obter dados da API: $e');
    }
  }

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
                        padding: EdgeInsets.all(12.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Solicitar afastamento'),
                        ),
                      ),
                      1: Padding(
                        padding: EdgeInsets.all(12.0),
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
                            alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.only(top: 16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 26.0),
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
                                  Expanded(
                                    flex: 3,
                                    child: InputFilter(
                                      // Replace CustomSelect with InputFilter
                                      options: [
                                        'Viagem',
                                        'Doença',
                                        'Evento',
                                        'Consulta médica'
                                      ],
                                      selectedOption: 'Viagem',
                                      onOptionChanged: (value) {
                                        // Lógica a ser executada quando um item for selecionado
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InputTextArea(
                            placeholder: "Descrição ...",
                          ),
                          FileInput(
                            label: "Selecione um arquivo:",
                            icon: Icons.note_add,
                          ),
                          SizedBox(height: 16),
                          Button(
                            label: 'SOLICITAR',
                            width: 150,
                            onPressed: () {
                              // Lógica a ser executada quando o botão for pressionado
                            },
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
                        'Visualize suas solicitações de afastamento',
                        style: const TextStyle(
                          color: Color(0xFF4C525A),
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: 16),
                      ExpandingCardAbsences(
                        title: 'SCDP [Viagem] - 12/07 a 14/07',
                        description:
                            'Participação em oficina na SNCT realizada em Imperatriz.',
                        schedules: [
                          'M3 - Estrutura de dados (Info 2)',
                          'M4 - Estrutura de dados (Info 2)'
                        ],
                        status: 0,
                      ),
                      ExpandingCardAbsences(
                        title: 'SCDP [Viagem] - 16/07',
                        description:
                            'Participação em oficina na SNCT realizada em Imperatriz.',
                        schedules: [
                          'M3 - Estrutura de dados (Info 2)',
                          'M4 - Estrutura de dados (Info 2)'
                        ],
                        status: 1,
                      ),
                      ExpandingCardAbsences(
                        title: 'SCDP [Viagem] - 12/07 a 14/07',
                        description:
                            'Participação em oficina na SNCT realizada em Imperatriz.',
                        schedules: [
                          'M3 - Estrutura de dados (Info 2)',
                          'M4 - Estrutura de dados (Info 2)',
                          'M5 - Estrutura de dados (Info 2)',
                          'M6 - Estrutura de dados (Info 2)'
                        ],
                        status: 2,
                      ),
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
