extension Capitalize on String {
  String get titleCase => contains(" ")
      ? split(" ")
          .map((word) => word[0].toUpperCase() + word.substring(1))
          .join(" ")
      : this[0].toUpperCase() + substring(1);
}
