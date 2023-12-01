import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAbsencesScreen extends StatefulWidget {
  final bool useWhiteAppBar;

  const MyAbsencesScreen({Key? key, this.useWhiteAppBar = false}) : super(key: key);

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
              margin: const EdgeInsets.only(top: 0.0),
              child: const Text.rich(
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
        iconTheme: const IconThemeData(color: Color(0xFF686565)),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - appBarHeight,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, // Center the entire column
              children: [
                const Text(
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
                const SizedBox(height: 26),
                Align(
                  alignment: Alignment.center,
                  child: CupertinoSegmentedControl(
                    children: const {
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
                const SizedBox(height: 26),
                selectedSegment == 0
                    ? const Text('Solicite um afastamento das aulas')
                    : const Text('Visualize seus afastamentos'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
