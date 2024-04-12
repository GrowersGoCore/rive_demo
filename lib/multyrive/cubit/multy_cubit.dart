import 'package:bloc/bloc.dart';
import 'package:rive/rive.dart';
import 'package:rivebloc_test/multyrive/multyService/riveservice.dart';

// State
class MultianimationState {
  List<String> backgroundArtboards;
  double sliderValue;

  MultianimationState(this.backgroundArtboards, this.sliderValue);

  MultianimationState copyWith({List<String>? backgroundArtboards, double? sliderValue}) {
    return MultianimationState(
      backgroundArtboards ?? this.backgroundArtboards,
      sliderValue ?? this.sliderValue,
    );
  }
}

// CUBIT
class MultianimationCubit extends Cubit<MultianimationState> {

  late RiveService service;
  
  MultianimationCubit([RiveService? _service])
    : service = _service ?? RiveService(),
    super(MultianimationState([], 0));
  
  //List<String> backgroundArtboards = [];
  //double _sliderMax = 100;

  
  Future<void> loadArtboardNames() async {
    final RiveFile riveFile = await service.getFile();
    
    List<String>backgroundArtboards = riveFile.artboards
      .map((artboard) => artboard.name)
      .where((name) => name.startsWith('tomato_'))
      .toList();
  
    backgroundArtboards.sort();
    double sliderValue = backgroundArtboards.length.toDouble() - 1;
    //emit(0);
    emit(MultianimationState(backgroundArtboards, sliderValue));
    updateSliderValue(0);
  }

  void updateSliderValue(double value) { 
    //emit(value); 
    emit(state.copyWith(sliderValue: value));
  }

  //void emitMaxAndDivisions() { 
    //emit(_sliderValue); 
  //  emit(state.copyWith());
  //}

  //double getSliderValue() { return state.backgroundArtboards.length - 1; }
  //int getSliderDivisions() { return state.sliderValue.toInt(); }

}