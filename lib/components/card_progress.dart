import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ExpandingCardProgress extends StatefulWidget {
  final String title;
  final String workload;
  final String workloadCompleted;
  final double progressPercent;

  const ExpandingCardProgress({
    Key? key,
    required this.title,
    required this.workload,
    required this.workloadCompleted,
    required this.progressPercent,
  }) : super(key: key);

  @override
  _ExpandingCardState createState() => _ExpandingCardState();
}

class _ExpandingCardState extends State<ExpandingCardProgress> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ExpansionTile(
        title: SizedBox(
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Color(0xFF4C525A),
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
              },
              children: [
                _buildTableRow('C.H.', widget.workload),
                _buildDivider(),
                _buildTableRow('C.H. Cumprida', widget.workloadCompleted),
                _buildDivider(),
                _buildProgressRow('Progresso', widget.progressPercent),
              ],
            ),
          ),
        ],
        onExpansionChanged: (value) {
          setState(() {
            _isExpanded = value;
          });
        },
      ),
    );
  }

  TableRow _buildProgressRow(String header, double progressPercent) {
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
              child: LinearPercentIndicator(
                lineHeight: 18.0,
                animation: true,
                animationDuration: 1500,
                percent: progressPercent,
                backgroundColor: const Color(0xFFE0E0E0),
                progressColor: const Color(0xFF1B896E),
                // ignore: deprecated_member_use
                linearStrokeCap: LinearStrokeCap.roundAll,
                center: Text(
                  '${(progressPercent * 100).toStringAsFixed(1)}%',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
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
