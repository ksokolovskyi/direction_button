import 'package:direction_button/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Button(
                  onPressed: () {},
                ),
              ),
            ),
            const Positioned(
              right: 15,
              bottom: -15,
              child: FlutterLogo(
                size: 70,
                style: FlutterLogoStyle.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
