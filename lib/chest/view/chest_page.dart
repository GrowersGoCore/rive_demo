import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivebloc_test/chest/cubit/chest_cubit.dart';
import 'package:rivebloc_test/chest/view/chest_view.dart';

class ChestPage extends StatelessWidget {
  const ChestPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChestCubit(),
      child: const ChestView(),
    );
  }
}