import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider.dart';
import 'SuccessPage.dart';
import 'keypad_number.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CircularTextFieldProvider(),
      child: const MaterialApp(
        home: MyApp(),
      ),
    ),
  );
}

class CircularTextFieldModel {
  String text = '';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      // ),
      body: Center(
        child: Column(
          children: [
            const CircularTextField(),
            const SizedBox(height: 15),
            Keypad(),
          ],
        ),
      ),
    );
  }
}

class CircularTextField extends StatelessWidget {
  const CircularTextField({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CircularTextFieldProvider>(context);

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 150), // Add margin here
          child: const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/groww.png'),
            // backgroundImage: NetworkImage('https://picsum.photos/id/1/200/300'),
          ),
        ),
        const SizedBox(height: 18),

        const Text(
          'Enter Groww PIN',
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        const SizedBox(height: 18), // Smaller space
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'kaviyavarshini@gmail.com',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black54,
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              'Logout',
              style: TextStyle(
                color: Color.fromARGB(255, 39, 227, 192),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            4,
            (index) => CircularField(provider: provider, index: index),
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'Use TouchID',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(255, 39, 227, 192)),
        )
      ],
    );
  }
}

class CircularField extends StatelessWidget {
  final CircularTextFieldProvider provider;
  final int index;

  const CircularField({required this.provider, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 3.0, color: Color.fromARGB(255, 71, 98, 91)),
      ),
      child: Center(
        child: Text(
          provider.circularTextFieldModels[index].text,
          style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 71, 98, 91),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// class Keypad extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<CircularTextFieldProvider>(context);
//
//     Widget buildKeypadRow(List<String> numbers) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children:
//             numbers.map((number) => KeypadNumber(number: number)).toList(),
//       );
//     }
//
//     return Column(
//       children: [
//         buildKeypadRow(['1', '2', '3']),
//         const SizedBox(height: 20),
//         buildKeypadRow(['4', '5', '6']),
//         const SizedBox(height: 20),
//         buildKeypadRow(['7', '8', '9']),
//         const SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               onPressed: () {
//                 provider.clearText();
//               },
//               icon: const Icon(Icons.cancel_outlined),
//               color: const Color.fromARGB(255, 39, 227, 192),
//             ),
//             KeypadNumber(number: '0'),
//             IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => SuccessPage(),
//                   ),
//                 );
//                 // Implement functionality for the correct button
//               },
//               icon: const Icon(Icons.verified_user),
//               color: const Color.fromARGB(255, 39, 227, 192),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
class Keypad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CircularTextFieldProvider>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            KeypadNumber(number: '1'),
            KeypadNumber(number: '2'),
            KeypadNumber(number: '3'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            KeypadNumber(number: '4'),
            KeypadNumber(number: '5'),
            KeypadNumber(number: '6'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            KeypadNumber(number: '7'),
            KeypadNumber(number: '8'),
            KeypadNumber(number: '9'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                provider.clearText();
              },
              icon: const Icon(Icons.cancel_outlined),
              color: const Color.fromARGB(255, 39, 227, 192),
            ),
            KeypadNumber(number: '0'),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SuccessPage(),
                  ),
                );
                // Implement functionality for the correct button
              },
              icon: const Icon(Icons.verified_user),
              color: const Color.fromARGB(255, 39, 227, 192),
            ),
          ],
        ),
      ],
    );
  }
}
