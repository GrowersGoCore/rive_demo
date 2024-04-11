import 'package:bloc/bloc.dart';
import 'package:rive/rive.dart';
import 'package:rivebloc_test/multyrive/multyService/riveservice.dart';



class MultianimationCubit extends Cubit<double> {
   late RiveService service;
  MultianimationCubit([RiveService? _service]) : super(0) {
    service = _service ?? RiveService();
  }
  List<String> backgroundArtboards = [];
  double _sliderMax = 100;

Future<void> loadArtboardNames() async {
  final RiveFile riveFile = await service.getFile();
  backgroundArtboards = riveFile.artboards
      .map((artboard) => artboard.name)
      .where((name) => name.startsWith('tomato_'))
      .toList();
  
  backgroundArtboards.sort();
  _sliderMax = backgroundArtboards.length.toDouble() - 1;
  emit(0);
  updateSliderValue(0);
}


  void updateSliderValue(double value) {
    emit(value);
  }

  void emitMaxAndDivisions() {
    emit(_sliderMax);
  }

  double getSliderMax() {
    return _sliderMax;
  }

  int getSliderDivisions() {
    return _sliderMax.toInt();
  }
}
