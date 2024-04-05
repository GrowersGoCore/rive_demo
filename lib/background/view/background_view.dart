import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BackgroundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fondo'),
      ),
      body: Stack(
        children: [
          Center(
            child: RiveAnimation.asset(
              'assets/background.riv',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: RiveAnimation.asset(
              'assets/faces.riv',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
