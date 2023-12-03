import 'package:flutter/material.dart';

import 'button.dart';

class ExpandingCardAbsences extends StatefulWidget {
  final String title;
  final String description;
  final List<String> schedules;
  final int status;

  const ExpandingCardAbsences({
    Key? key,
    required this.title,
    required this.description,
    required this.schedules,
    required this.status,
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
                _buildRow("Descrição", widget.description),
                _buildDivider(),
                _buildColumn("Horários", widget.schedules),
                _buildDivider(),
                _buildRow("Status", _getDescriptionText(widget.status)),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: Button(
                    label: 'EXCLUIR',
                    width: 100,
                    onPressed: () {
                      // Lógica a ser executada quando o botão for pressionado
                    },
                  ),
                ),
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

  Widget _buildColumn(String header, List<String> values) {
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: values
              .map(
                (value) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 4.0),
                      child: Icon(
                        Icons.circle,
                        size: 16,
                        color: Color(0xFF758D94),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        value,
                        style: const TextStyle(
                          color: Color(0xFF758D94),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
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

  String _getDescriptionText(int value) {
    switch (value) {
      case 0:
        return "Em análise";
      case 1:
        return "Deferido";
      case 2:
        return "Indeferido";
      default:
        return "";
    }
  }
}
