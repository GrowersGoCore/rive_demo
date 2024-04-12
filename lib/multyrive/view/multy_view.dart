import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:rivebloc_test/multyrive/cubit/multy_cubit.dart';

class MultianimationView extends StatefulWidget {
  const MultianimationView({Key? key}) : super(key: key);

  @override
  _MultianimationViewState createState() => _MultianimationViewState();
}

class _MultianimationViewState extends State<MultianimationView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MultianimationCubit>(context).loadArtboardNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Animations'),
      ),
      body: BlocBuilder<MultianimationCubit, MultianimationState>(
        builder: (context, multianimationState) {
          final cubit = BlocProvider.of<MultianimationCubit>(context);
          return Center(
            child: Column(
              children: [
                Expanded(
                  child: multianimationState.backgroundArtboards.isNotEmpty
                      ? RiveAnimation.asset(
                          'assets/multy2.riv',
                          artboard: multianimationState
                              .backgroundArtboards[multianimationState.sliderValue.toInt()],
                          fit: BoxFit.contain,
                        )
                      : const CircularProgressIndicator(),
                ),
                Slider(
                  value: multianimationState.sliderValue,
                  min: 0,
                  max: multianimationState.backgroundArtboards.isNotEmpty
                      ? multianimationState.backgroundArtboards.length - 1 : 100,
                  divisions:  multianimationState.backgroundArtboards.isNotEmpty
                      ? multianimationState.backgroundArtboards.length - 1 : 100,
                  onChanged: (value) {
                    cubit.updateSliderValue(value);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}