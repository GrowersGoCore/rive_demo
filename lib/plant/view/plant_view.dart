import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:rivebloc_test/plant/cubit/plant_cubit.dart';

class PlantView extends StatefulWidget {
  const PlantView({Key? key}) : super(key: key);

  @override
  _PlantViewMachineState createState() => _PlantViewMachineState();
}

class _PlantViewMachineState extends State<PlantView> {
  late double _sliderValue;

  @override
  void initState() {
    super.initState();
    _sliderValue = BlocProvider.of<PlantCubit>(context).sliderValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('planta'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: RiveAnimation.asset(
                'assets/planta.riv',
                fit: BoxFit.contain,
                onInit: BlocProvider.of<PlantCubit>(context).onRiveInit,
              ),
            ),
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() {
                  _sliderValue = BlocProvider.of<PlantCubit>(context).updateGrowValue(value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
