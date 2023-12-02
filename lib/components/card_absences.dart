import 'package:flutter/material.dart';

import 'button.dart';

class ExpandingCardAbsences extends StatefulWidget {
  final String title;
  final String rowTitle1;
  final String rowDescription1;
  final String rowTitle2;
  final String rowDescription2;
  final String rowTitle3;
  final String rowDescription3;

  const ExpandingCardAbsences({
    Key? key,
    required this.title,
    required this.rowTitle1,
    required this.rowDescription1,
    required this.rowTitle2,
    required this.rowDescription2,
    required this.rowTitle3,
    required this.rowDescription3,
  }) : super(key: key);

  @override
  _ExpandingCardAbsencesState createState() => _ExpandingCardAbsencesState();
}

class _ExpandingCardAbsencesState extends State<ExpandingCardAbsences> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRow(widget.rowTitle1, widget.rowDescription1),
                _buildDivider(),
                _buildRow(widget.rowTitle2, widget.rowDescription2),
                _buildDivider(),
                _buildRow(widget.rowTitle3, widget.rowDescription3),
                const SizedBox(height: 16),
                Button(
                  label: 'EXCLUIR',
                  width: 100,
                  onPressed: () {
                    // Lógica a ser executada quando o botão for pressionado
                  },
                )
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

  Widget _buildRow(String header, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            color: Color(0xFF4C525A),
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF758D94),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Color(0xFFD8D8D8),
    );
  }
}
