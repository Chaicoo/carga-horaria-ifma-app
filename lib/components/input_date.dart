import 'package:flutter/material.dart';

class DateInputCard extends StatelessWidget {
  final String title;
  final String type;

  const DateInputCard({required this.title, required this.type, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF4C525A),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
            Flexible(
              flex: 6,
              child: buildDateInputWidget(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDateInputWidget(BuildContext context) {
    TextEditingController dateController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(left: 1.0),
      child: TextFormField(
        controller: dateController,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
          border: OutlineInputBorder(),
        ),
        readOnly: true,
        onTap: () async {
          DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );

          if (selectedDate != null) {
            final day = selectedDate.day < 10 ? '0${selectedDate.day}' : '${selectedDate.day}';
            final month = selectedDate.month < 10 ? '0${selectedDate.month}' : '${selectedDate.month}';

            dateController.text = "$day/$month";
          }
        },
        style: const TextStyle(
          color: Color(0xFF758D94),
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
