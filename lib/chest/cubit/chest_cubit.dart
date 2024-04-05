import 'package:bloc/bloc.dart';
import 'package:rive/rive.dart';

class ChestCubit extends Cubit<double> {
  ChestCubit() : super(0);

  late SMIBool isopen;

  void onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    isopen = controller.findInput<bool>('open?') as SMIBool;
  }

  void open(){
     isopen.value=!isopen.value;
  }

}