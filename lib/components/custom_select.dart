import 'package:flutter/material.dart';

class CustomSelect extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomSelect({
    Key? key,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomSelectState createState() => _CustomSelectState();
}

class _CustomSelectState extends State<CustomSelect> {
  late String selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.items.isNotEmpty ? widget.items[0] : '';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              isExpanded: true,
              value: selectedItem,
              onChanged: (String? value) {
                setState(() {
                  selectedItem = value!;
                  widget.onChanged(value);
                });
              },
              items: widget.items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
