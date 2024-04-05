import 'package:flutter/material.dart';
import 'package:rivebloc_test/background/view/background_page.dart';
import 'package:rivebloc_test/chest/view/chest_page.dart';
import 'package:rivebloc_test/plant/view/plant_page.dart';

class HomeView extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BackgroundPage(),
                  ),
                );
              },
              child: Text('Fondo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChestPage(),
                  ),
                );
              },
              child: Text('Cofre'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlantPage(),
                  ),
                );
              },
              child: Text('Planta'),
            ),
          ],
        ),
      ),
    );
  }
}
