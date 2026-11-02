/// Locates a Congolese plate from its area code (the last one or two digits).
///
/// Source: the "Regular license plates" section of
/// https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_the_Republic_of_the_Congo
abstract final class RepublicOfTheCongoRegions {
  static const Map<String, String> _areas = <String, String>{
    '1': 'Nkayi',
    '2': 'Lekoumou',
    '3': 'Ouesso',
    '4': 'Capital District (Brazzaville)',
    '5': 'Kouilou',
    '6': 'Pointe-Noire',
    '7': 'Likouala',
    '8': 'Cuvette',
    '9': 'Nyari',
    '10': 'Loubomo',
    '11': 'Bouenza',
    '12': 'Pool',
    '13': 'Sanga',
    '14': 'Plateau',
  };

  /// `1` is a complete code, so it names Nkayi until a second digit makes it
  /// 10–14.
  static String? lookup(String code) => _areas[code];

  // TODO(py): [D4-table] lookup table: becomes a dict in the export, no code.
  // TODO(ts): [D4-table] lookup table: becomes data in the export, no code.
  // TODO(kt): [D4-table] lookup table: becomes a map in the export, no code.
  static String? captionOf(String Function(String key) group) =>
      lookup(group('area'));
}
