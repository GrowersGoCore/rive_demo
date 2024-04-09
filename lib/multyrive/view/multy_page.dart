import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivebloc_test/multyrive/cubit/multy_cubit.dart';
import 'package:rivebloc_test/multyrive/view/multy_view.dart';


class MultianimationPage extends StatelessWidget {
  const MultianimationPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MultianimationCubit(),
      child: const MultianimationView(),
    );
  }
}