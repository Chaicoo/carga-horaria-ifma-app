import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableCardSchedule extends StatefulWidget {
  final String title;
  final List<String> morningSchedule;
  final List<String> afternoonSchedule;

  final List<String> morningFixedSchedule = [
    'M1',
    'M2',
    'M3',
    'M4',
    'M5',
    'M6'
  ];
  final List<String> afternoonFixedSchedule = [
    'T1',
    'T2',
    'T3',
    'T4',
    'T5',
    'T6'
  ];

  ExpandableCardSchedule({
    Key? key,
    required this.title,
    required this.morningSchedule,
    required this.afternoonSchedule,
  }) : super(key: key);

  @override
  _ExpandableCardScheduleState createState() => _ExpandableCardScheduleState();
}

class _ExpandableCardScheduleState extends State<ExpandableCardSchedule> {
  int selectedSegment = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ExpansionTile(
        title: Center(
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                CupertinoSegmentedControl(
                  children: const {
                    0: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Matutino'),
                      ),
                    ),
                    1: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Vespertino'),
                      ),
                    ),
                  },
                  groupValue: selectedSegment,
                  onValueChanged: (int? value) {
                    setState(() {
                      selectedSegment = value ?? 0;
                    });
                  },
                ),
                const SizedBox(height: 16),
                IndexedStack(
                  index: selectedSegment,
                  children: [
                    _buildScheduleTable(
                      widget.morningFixedSchedule,
                      widget.morningSchedule,
                      'Dias da Semana Matutino',
                    ),
                    _buildScheduleTable(
                      widget.afternoonFixedSchedule,
                      widget.afternoonSchedule,
                      'Dias da Semana Vespertino',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleTable(
    List<String> fixedSchedule,
    List<String> schedule,
    String days,
  ) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(100),
        1: FlexColumnWidth(1),
      },
      children: [
        for (var i = 0; i < fixedSchedule.length; i++) ...[
          _buildScheduleRow(
            fixedSchedule[i],
            schedule.isNotEmpty ? schedule[i] : '',
            days,
          ),
          _buildDivider(),
        ],
      ],
    );
  }

  TableRow _buildTableRow(String header1, String header2) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                header1,
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
                header2,
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

  TableRow _buildScheduleRow(String time, String schedule, String days) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                time,
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
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                schedule,
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
}
