
import 'package:flutter_test/flutter_test.dart';
import 'package:rive/rive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rivebloc_test/multyrive/cubit/multy_cubit.dart';
import 'package:rivebloc_test/multyrive/multyService/riveservice.dart';

//Mock Class for RiveFile
class MockRiveFile extends Mock implements RiveFile {}
class MockRiveService extends Mock implements RiveService {
}
void main() {
  group('MultianimationCubit', () {
    late MultianimationCubit cubit;
    late RiveFile mockRiveFile;
    late RiveService mockRiveService;
    setUp(() {
      cubit = MultianimationCubit();
      mockRiveFile = MockRiveFile();
      mockRiveService=MockRiveService();
      //cubit = MultianimationCubit(mockRiveService);
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    tearDown(() {
      cubit.close();
    });
  test('loadArtboardNames sets backgroundArtboards correctly', () async {
  // Simulate artboards
  final artboards = [ 
            'tomato_00_anim',
            'tomato_01_anim',
            'tomato_02_anim',
            'tomato_03_anim',
            'tomato_04_anim',
            'tomato_05_anim',
            'tomato_06_anim',
            'tomato_07_anim',
            'tomato_08_anim',
            'tomato_09_anim',
            'tomato_10_anim',
            'tomato_11_anim',
            'tomato_12_anim'
            ];
  // Configurar mockRiveService y mockRiveFile
  when(() => mockRiveService.getFile()).thenAnswer((_) async => mockRiveFile);
  await cubit.loadArtboardNames(); // Llamada al método, asegúrate de esperar la promesa
  expect(cubit.state.backgroundArtboards, artboards);
});
    test('updateSliderValue emits correct value', () {
      const value = 5.0;
      cubit.updateSliderValue(value); //Method call
      expect(cubit.state.sliderValue, value); //Verify that the emitted value is correct
    });
  });
}