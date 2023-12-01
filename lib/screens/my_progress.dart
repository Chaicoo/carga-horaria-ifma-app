import 'package:flutter/material.dart';
import '../components/expanding_card.dart';

class MyProgressScreen extends StatelessWidget {
  final bool useWhiteAppBar;
  const MyProgressScreen({Key? key, this.useWhiteAppBar = false})
      : super(key: key);

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
              margin: const EdgeInsets.only(top: 0.0),
              child: const Text.rich(
                TextSpan(
                  text: 'Meus progressos',
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
        backgroundColor: useWhiteAppBar ? Colors.white : null,
        iconTheme: const IconThemeData(
            color: Color(0xFF686565)),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Progressos de carga horária',
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
              ExpandingCard(
                title: 'Nome da disciplina (turno)',
                row1Value: '10',
                row2Value: '5',
                progressPercent: 0.5,
              ),
              ExpandingCard(
                title: 'Nome da disciplina (turno)',
                row1Value: '15',
                row2Value: '10',
                progressPercent: 0.667,
              ),
              ExpandingCard(
                title: 'Nome da disciplina (turno)',
                row1Value: '20',
                row2Value: '15',
                progressPercent: 0.75,
              ),
              ExpandingCard(
                title: 'Nome da disciplina (turno)',
                row1Value: '20',
                row2Value: '15',
                progressPercent: 0.75,
              ),
              ExpandingCard(
                title: 'Nome da disciplina (turno)',
                row1Value: '20',
                row2Value: '15',
                progressPercent: 0.75,
              ),
              ExpandingCard(
                title: 'Nome da disciplina (turno)',
                row1Value: '20',
                row2Value: '15',
                progressPercent: 0.75,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
