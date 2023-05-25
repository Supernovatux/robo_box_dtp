import 'dart:math';

import 'package:robo_box_dtp/robo_box_dtp.dart';
import 'package:test/test.dart';

void main() {
  group('Testing the moves enum', () {
    final move1 = RoboMoveType.lh;
    final move2 = RoboMoveType.rh;
    final move3 = RoboMoveType.lv;
    final move4 = RoboMoveType.rv;

    setUp(() {
      // Additional setup goes here.
    });

    test('Testing to string', () {
      expect(move1.toString(), 'H');
      expect(move2.toString(), 'K');
      expect(move3.toString(), 'J');
      expect(move4.toString(), 'L');
    });
  });
  group('Testing the combo builder', () {
    final comboBuilder = RoboComboBuilder();
    final combo = comboBuilder
        .addMove(RoboMoveType.lh)
        .addMove(RoboMoveType.rh)
        .addMove(RoboMoveType.lv)
        .addMove(RoboMoveType.rv)
        .addName('Test')
        .build();
    final comboBuilder2 = RoboComboBuilder();
    final combo2 = comboBuilder2.addMove(RoboMoveType.lh).build();
    final comboBuilder3 = RoboComboBuilder();
    setUp(() {});

    test('Testing to string', () {
      expect(combo.toString(), '4,H,K,J,L');
      expect(combo2.toString(), '1,H');
      expect(() => comboBuilder3.build(), throwsException);
    });
  });
  group('Testing the state builder', () {
    final stateBuilder = RoboStateBuilder();
    final comboBuilder = RoboComboBuilder();
    final combo = comboBuilder
        .addMove(RoboMoveType.lh)
        .addMove(RoboMoveType.rh)
        .addMove(RoboMoveType.lv)
        .addMove(RoboMoveType.rv)
        .addName('Test')
        .build();
    final comboBuilder2 = RoboComboBuilder();
    final combo2 = comboBuilder2.addMove(RoboMoveType.lh).build();
    final state = stateBuilder.addCombo(combo).addCombo(combo2).build();
    setUp(() {});

    test('Testing to string', () {
      expect(combo.toString(), '4,H,K,J,L');
      expect(combo2.toString(), '1,H');
      expect(state.init(), '==INIT==:2:4,H,K,J,L;1,H;');
      expect(state.start(1, 10), "Start:1:10.0");
      expect(state.end(), "Stop");
    });
  });
}
