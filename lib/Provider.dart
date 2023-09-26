import 'package:flutter/material.dart';

import 'main.dart';

class CircularTextFieldProvider extends ChangeNotifier {
  final List<CircularTextFieldModel> _circularTextFieldModels = List.generate(
    4,
    (index) => CircularTextFieldModel(),
  );

  List<CircularTextFieldModel> get circularTextFieldModels =>
      _circularTextFieldModels;

  void setText(int index, String newText) {
    _circularTextFieldModels[index].text = newText;
    notifyListeners();
  }

//   void clearText() {
//     for (int i = 0; i < _circularTextFieldModels.length; i++) {
//       if (_circularTextFieldModels[i].text.isNotEmpty) {
//         _circularTextFieldModels[i].text = '';
//         notifyListeners();
//         break;
//       }
//     }
//   }
// }

  void clearText() {
    for (int i = _circularTextFieldModels.length - 1; i >= 0; i--) {
      if (_circularTextFieldModels[i].text.isNotEmpty) {
        _circularTextFieldModels[i].text = '';
        notifyListeners();
        break;
      }
    }
  }
}
