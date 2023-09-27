import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'Provider.dart';

class KeypadNumber extends StatelessWidget {
  final String number;

  KeypadNumber({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CircularTextFieldProvider>(context);

    return GestureDetector(
      onTap: () {
        for (int i = 0; i < provider.circularTextFieldModels.length; i++) {
          if (provider.circularTextFieldModels[i].text.isEmpty) {
            provider.setText(i, number);
            break;
          }
        }
      },
      child: Text(
        number,
        style: const TextStyle(
            fontSize: 40, color: Color.fromARGB(255, 39, 227, 192)),
      ),
    );
  }
}
