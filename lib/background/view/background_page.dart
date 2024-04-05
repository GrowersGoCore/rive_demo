import 'package:flutter/material.dart';
import 'package:rivebloc_test/background/view/background_view.dart';


class BackgroundPage extends StatelessWidget {
  const BackgroundPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BackgroundView(),
      ),
    );
  }
}