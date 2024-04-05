import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:rivebloc_test/chest/cubit/chest_cubit.dart';

class ChestView extends StatefulWidget {
  const ChestView({Key? key}) : super(key: key);

  @override
  _PlantViewMachineState createState() => _PlantViewMachineState();
}

class _PlantViewMachineState extends State<ChestView> {

  @override
  void initState() {
    super.initState();
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cofre'),
      ),
      body: Center(
        child: GestureDetector(
          onTap:  BlocProvider.of<ChestCubit>(context).open,
          child: RiveAnimation.asset(
            'assets/cofre.riv',
            fit: BoxFit.contain,
            onInit: BlocProvider.of<ChestCubit>(context).onRiveInit,
          ),
        ),
      ),
    );
  }
}
