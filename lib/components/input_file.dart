import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileInput extends StatefulWidget {
  final String label;
  final IconData icon;

  const FileInput({Key? key, required this.label, required this.icon})
      : super(key: key);

  @override
  _FileInputState createState() => _FileInputState();
}

class _FileInputState extends State<FileInput> {
  String? filePath;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        filePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickFile,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(widget.icon),
                  SizedBox(width: 10.0),
                  Text(
                    widget.label,
                    style: TextStyle(
                      color: Color(0xFF4C525A),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ],
              ),
              if (filePath != null)
                Text(
                  filePath!,
                  style: TextStyle(
                    color: Color(0xFF1B896E),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 0.32,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
