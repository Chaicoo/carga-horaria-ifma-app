import 'package:flutter/material.dart';

class InputFilter extends StatefulWidget {
  final List<String> options;
  final String selectedOption;
  final void Function(String) onOptionChanged;

  const InputFilter({
    Key? key,
    required this.options,
    required this.selectedOption,
    required this.onOptionChanged,
  }) : super(key: key);

  @override
  _InputFilterState createState() => _InputFilterState();
}

class _InputFilterState extends State<InputFilter> {
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
            DropdownButton<String>(
              value: widget.selectedOption,
              onChanged: (newValue) {
                setState(() {
                  widget.onOptionChanged(newValue!);
                });
              },
              items: widget.options.map((option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(
                    option,
                    style: TextStyle(
                      color: Color(0xFF758D94),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
