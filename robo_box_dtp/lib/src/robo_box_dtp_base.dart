// TODO: Put public facing types in this file.

class RoboCombo {
  static const String seperator = ',';
  final List<RoboMoveType> moves;
  final String name;
  RoboCombo(this.name, this.moves);
  @override
  toString() => moves.length.toString() + seperator + moves.join(seperator);
}

class RoboComboBuilder {
  final List<RoboMoveType> moves = [];
  String name = "Combo${DateTime.now().millisecondsSinceEpoch}";
  RoboComboBuilder();

  RoboComboBuilder.named(this.name);

  RoboComboBuilder addMove(RoboMoveType move) {
    moves.add(move);
    return this;
  }

  RoboComboBuilder addMoves(List<RoboMoveType> moves) {
    this.moves.addAll(moves);
    return this;
  }

  RoboComboBuilder addName(String name) {
    this.name = name;
    return this;
  }

  RoboCombo build() {
    if (moves.isEmpty) {
      throw Exception("No moves added");
    }
    return RoboCombo(name, moves);
  }
}

enum RoboMoveType {
  lh(name: "H"),
  lv(name: "J"),
  rh(name: "K"),
  rv(name: "L");

  final String name;
  const RoboMoveType({required this.name});
  @override
  toString() => name;
}

class RoboState {
  static const String magic = "==INIT==";
  static const separator = ':';
  static const comboSeparator = ';';
  static const startMagic = "Start";
  static const endMagic = "Stop";
  final List<RoboCombo> combos;
  RoboState(this.combos);
  String end() => endMagic;
  String init() =>
      magic +
      separator +
      combos.length.toString() +
      separator +
      combos.join(comboSeparator) +
      comboSeparator;

  String start(int index, double speed) {
    if (index < 0 || index >= combos.length) {
      throw Exception("Invalid index");
    }
    return startMagic +
        separator +
        index.toString() +
        separator +
        speed.toString();
  }

  @override
  toString() => init();
}

class RoboStateBuilder {
  final List<RoboCombo> combos = [];
  RoboStateBuilder addCombo(RoboCombo combo) {
    combos.add(combo);
    return this;
  }

  RoboStateBuilder addCombos(List<RoboCombo> combos) {
    this.combos.addAll(combos);
    return this;
  }

  RoboState build() {
    if (combos.isEmpty) {
      throw Exception("No combos added");
    }
    return RoboState(combos);
  }
}
