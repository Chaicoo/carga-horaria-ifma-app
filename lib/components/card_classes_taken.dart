import 'package:flutter/material.dart';

class CardClassTaken extends StatelessWidget {
  final String title;
  final String row1Value;
  final String row2Value;
  final String row3Value;

  const CardClassTaken({
    Key? key,
    required this.title,
    required this.row1Value,
    required this.row2Value,
    required this.row3Value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF4C525A),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 16),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
              },
              children: [
                _buildTableRow("Data", row1Value),
                _buildDivider(),
                _buildTableRow("Status", row2Value),
                _buildDivider(),
                _buildTableRow("Assumida por", row3Value),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String header, String value) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                header,
                style: const TextStyle(
                  color: Color(0xFF4C525A),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                value,
                style: const TextStyle(
                  color: Color(0xFF758D94),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  TableRow _buildDivider() {
    return const TableRow(
      children: [
        TableCell(
          child: Divider(
            color: Color(0xFFD8D8D8),
          ),
        ),
        TableCell(
          child: Divider(
            color: Color(0xFFD8D8D8),
          ),
        ),
      ],
    );
  }
}
