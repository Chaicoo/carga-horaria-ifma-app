import 'package:flutter/material.dart';

class MyProgressScreen extends StatelessWidget {
  final bool useWhiteAppBar; // Adicione essa propriedade
  const MyProgressScreen({Key? key, this.useWhiteAppBar = false}) : super(key: key);

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
      ),
      body: Container(),
    );
  }
}
