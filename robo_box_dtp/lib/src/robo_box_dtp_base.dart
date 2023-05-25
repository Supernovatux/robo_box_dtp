// TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.
class Awesome {
  bool get isAwesome => true;
}

enum RoboMoveType {
  lh(name: "h"),
  lv(name: "j"),
  rh(name: "k"),
  rv(name: "l");

  const RoboMoveType({required this.name});
  final String name;
}
