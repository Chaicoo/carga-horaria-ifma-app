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

  String getFileName() {
    if (filePath != null) {
      File file = File(filePath!);
      return file.path.split('/').last;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickFile,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (filePath == null)
                Row(
                  children: [
                    Text(
                      widget.label,
                      style: const TextStyle(
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
                  getFileName(),
                  style: const TextStyle(
                    color: Color(0xFF1B896E),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.32,
                  ),
                ),
              if (filePath == null) const SizedBox(width: 10.0),
              if (filePath == null) Icon(widget.icon, color: Color(0xFF1B896E)),
            ],
          ),
        ),
      ),
    );
  }
}
