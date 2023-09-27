// test/keypad_number_test.dart

import 'package:eval_task_calculator/Provider.dart';
import 'package:eval_task_calculator/keypad_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('KeypadNumber sets text in provider on tap',
      (WidgetTester tester) async {
    final provider = CircularTextFieldProvider();

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider.value(
          value: provider,
          child: KeypadNumber(
            number: '2',
          ),
        ),
      ),
    );

    final keypadNumber = find.text('2');

    await tester.tap(keypadNumber);

    // Trigger a rebuild
    await tester.pump();

    // Verify that the text is set in the provider
    expect(provider.circularTextFieldModels[0].text, '2');
  });
}
