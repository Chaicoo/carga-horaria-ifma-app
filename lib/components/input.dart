import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const Input({
    required this.labelText,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *
          0.8, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(
              color: Color(0xFF4C525A),
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          SizedBox(
            height: 44,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(24.0), // Bordas arredondadas
                ),
                // Adicione outros parâmetros do InputDecoration conforme necessário
              ),
              // Adicione outros parâmetros do TextField conforme necessário
            ),
          ),
        ],
      ),
    );
  }
}
