import 'package:flutter/material.dart';
import 'package:rivebloc_test/home/view/home_view.dart';




class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: HomeView(),
      ),
    );

  }
}